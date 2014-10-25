

import java.io.IOException;
import java.net.URI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriBuilder;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
/**
 * Servlet implementation class Controller
 */
@WebServlet(name="Controller",urlPatterns={"/home","/showOrder"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ClientConfig config = new DefaultClientConfig();
	Client client = Client.create(config);
	WebResource service = client.resource(getBaseURI());
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Form form = new Form();
//		form.add("id", "17");
//		form.add("coffeetype", "Latte");
//		form.add("cost", "3.50");
//		form.add("additions", "Hazelnut");
//		ClientResponse response1 = service.path("rest").path("orders").type(MediaType.APPLICATION_FORM_URLENCODED)
//									.header("Auth", "ac123").post(ClientResponse.class, form);
		if(request.getParameter("getOneOrder") != null){
			Order o = service.path("rest").path("orders/"+request.getParameter("id")).accept(
					MediaType.APPLICATION_XML).header("Auth", "abc123").get(Order.class);
			request.setAttribute("id", o.getId());
			request.setAttribute("coffeeType", o.getCoffeeType());
			request.setAttribute("additions", o.getAdditions());
			request.setAttribute("cost", o.getCost());
			request.getRequestDispatcher("showorder.jsp").forward(request, response);
		}
		else
			request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	private static URI getBaseURI() {
		return UriBuilder.fromUri(
				"http://localhost:8080/CoffeeService").build();
	}

}
