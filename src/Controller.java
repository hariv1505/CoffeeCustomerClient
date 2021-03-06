

import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriBuilder;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.GenericType;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;

/**
 * Servlet implementation class Controller
 */
@WebServlet(name="Controller",urlPatterns={"/","/home","/showOrder","/showPayment","/deleteOrder","/addOrder","/updateOrder","/pay","/confirmation"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static String HOST = "localhost";
       
	ClientConfig config = new DefaultClientConfig();
	Client client = Client.create(config);
	WebResource service = client.resource(getBaseURI());
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Error Handling e.g. paying when payment done etc.
		// TODO OPTIONS couldn't figure out how to do it
		List<Order> ords = service.path("rest").path("orders").accept(
				MediaType.APPLICATION_XML).header("Auth", "abc123").get(new GenericType<List<Order>>(){});
		List<Order> paidOrds = new ArrayList<Order>();
		for(Order od : ords){
			ClientResponse rp = service.path("rest").path("payments/"+od.getId()).accept(
					MediaType.APPLICATION_XML).header("Auth", "def456").get(ClientResponse.class);
			if(rp.getStatus() != 400)
				paidOrds.add(od);
		}
		
		if(request.getParameter("getOneOrder") != null){
			Order o = service.path("rest").path("orders/"+request.getParameter("id")).accept(
					MediaType.APPLICATION_XML).header("Auth", "abc123").get(Order.class);
			request.setAttribute("order", o);
			request.getRequestDispatcher("showorder.jsp").forward(request, response);
		}
		else if(request.getParameter("getOnePayment") != null){
			Payment p = service.path("rest").path("payments/"+request.getParameter("id")).accept(
					MediaType.APPLICATION_XML).header("Auth", "def456").get(Payment.class);
			request.setAttribute("payment", p);
			request.getRequestDispatcher("showpayment.jsp").forward(request, response);
		}
		else if(request.getParameter("getAllOrders") != null){
			request.setAttribute("orders", ords);
			request.getRequestDispatcher("showorders.jsp").forward(request, response);
		}
		else if(request.getParameter("delete") != null){
			Order o = service.path("rest").path("orders/"+request.getParameter("id")).accept(
					MediaType.APPLICATION_XML).header("Auth", "abc123").get(Order.class);
			if(o.getStatus() == null) {
				service.path("rest").path("orders/"+request.getParameter("id")).header("Auth", "abc123").delete();
				response.sendRedirect("confirmation?status=Deleted&id="+request.getParameter("id"));
			}
			else
				response.sendRedirect("confirmation?status=Order%20Being%20Prepared%20Cannot%20delete&id="+request.getParameter("id"));
		}
		
		else if(request.getParameter("payForOrder") != null){
			Order o = service.path("rest").path("orders/"+request.getParameter("id")).accept(
					MediaType.APPLICATION_XML).header("Auth", "abc123").get(Order.class);
			
			Payment p;

			if (request.getParameter("paytype").equals("card")) {
				p = new Payment(request.getParameter("id"), request.getParameter("paytype"),
						o.getCost(),request.getParameter("card_details"));
			}
			else{
				 p = new Payment(request.getParameter("id"), request.getParameter("paytype"),
							o.getCost());
			}
			
			ClientResponse resp = service.path("rest").path("payments").path(p.getId())
					.accept(MediaType.APPLICATION_XML).header("Auth","def456")
					.put(ClientResponse.class, p);
			response.sendRedirect("home?status=Paid&id="+request.getParameter("id"));
		}
		
		else if(request.getParameter("updateOrder") != null){
			Order ord = service.path("rest").path("orders/"+request.getParameter("id")).accept(
					MediaType.APPLICATION_XML).header("Auth", "abc123").get(Order.class);
			if(ord.getStatus() == null) {
				Order o;
				if(request.getParameter("additions") != ""){
					o = new Order(request.getParameter("id"), request.getParameter("coffeetype"),
							request.getParameter("cost"),request.getParameter("additions"));
				}
				else{
					 o = new Order(request.getParameter("id"), request.getParameter("coffeetype"),
							request.getParameter("cost"));
				}
				ClientResponse resp = service.path("rest").path("orders")
						.path(o.getId()).accept(MediaType.APPLICATION_XML).header("Auth","abc123")
						.put(ClientResponse.class, o);
				response.sendRedirect("home?status=Updated&id="+request.getParameter("id"));
			}
			else
				response.sendRedirect("confirmation?status=Order%20Being%20Prepared%20Cannot%20Update&id="+request.getParameter("id"));
		}
		
		else if(request.getParameter("newOrder") != null){
			Random rand = new Random();
			int randomNum = rand.nextInt((1000 - 1) + 1) + 1;
			Form form = new Form();
			form.add("id", Integer.toString(randomNum));
			form.add("coffeetype", request.getParameter("coffeetype"));
			form.add("cost", request.getParameter("cost"));
			form.add("additions", request.getParameter("additions"));
			ClientResponse resp = service.path("rest").path("orders").type(MediaType.APPLICATION_FORM_URLENCODED)
										.header("Auth", "abc123").post(ClientResponse.class, form);
			response.sendRedirect("home?status=Added&id="+request.getParameter("id"));
		}
		else if(request.getParameter("showOptions") != null){
			ClientResponse r = service.path("rest").path("orders/1").options(ClientResponse.class);
			request.setAttribute("options",r.getHeaders().get("Access-Control-Allow-Methods"));
			response.sendRedirect("home?status=Options&options="+r.getHeaders().get("Access-Control-Allow-Methods")+"&id="+request.getParameter("id"));
		}
		else if(request.getParameter("loadAddForm") != null){
			request.getRequestDispatcher("add.jsp").forward(request, response);
		}
		else if(request.getParameter("loadUpdateForm") != null){
			request.getRequestDispatcher("update.jsp").forward(request, response);
		}
		else if(request.getParameter("loadPayForm") != null){
			request.getRequestDispatcher("pay.jsp").forward(request, response);
		}
		else{
			request.setAttribute("options", request.getParameter("options"));
			request.setAttribute("id", request.getParameter("id"));
			request.setAttribute("status", request.getParameter("status"));
			request.setAttribute("paidOrders", paidOrds);
			request.setAttribute("orders", ords);
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	
	private static URI getBaseURI() {
		return UriBuilder
				.fromUri("http://" + HOST + ":8080/CoffeeService")
				.build();
	}

}
