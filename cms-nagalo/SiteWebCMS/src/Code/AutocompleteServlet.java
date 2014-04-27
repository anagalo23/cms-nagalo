package Code;

import java.io.IOException;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDAO;
import dto.ArticleDTO;

/**
 * Servlet implementation class AutocompleteServlet
 */
@WebServlet("/autocomplete")
public class AutocompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutocompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   //get the typed characters
        String query = request.getParameter("term");
        List<ArticleDTO> listRech = (List<ArticleDTO>) ArticleDAO
				.getInstance().getListeArticle();
        //get the usernames that match the typed characters
        List<String> titles = getData(listRech, query);
        //send the results in json format
   
        JsonArrayBuilder json = Json.createArrayBuilder();
        Iterator<String> iterator = titles.iterator();
        while(iterator.hasNext()) {
            String t = (String)iterator.next();
            json.add(t);
        }       JsonArray array = json.build();
        PrintWriter out= response.getWriter();
        out.print(array);
        out.flush();
        out.close();
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	   /**
     * get the list of usernames that matches a request
     * @param query
     * @param data
     * @return
     */
    private List<String> getData(List<ArticleDTO> data, String query ) {
        String title,contenu;
        query = query.toLowerCase();
        List<String> matched = new ArrayList<>();
        for(int i=0; i<data.size(); i++) {
        	
            title = data.get(i).getTitre().toLowerCase();
            contenu=data.get(i).getContenu_art().toLowerCase();
            if(title.startsWith(query) || contenu.contains(query)) {
                matched.add(data.get(i).getTitre());
            }
        }
        return matched;
    }


}

