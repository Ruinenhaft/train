

import java.io.*;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GreetingServlet
 */
@WebServlet("/GreetingServlet")
public class GreetingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PrintWriter logFile;
    public void init() throws ServletException{
    	String filename = getInitParameter("file_name");
    	try {
    		logFile = new PrintWriter(new FileWriter(filename, true));
    	}catch(IOException ioe) {
    		throw new ServletException(ioe);
    	}
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GreetingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = request.getParameter("name");
		String greeting = "안녕하세요" + name + "님";
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>덧셈프로그램</title></head>");
		out.println("<body>");
		out.printf(greeting);
		out.println("</body>");
		out.println("</html>");
		if(logFile != null) {
			GregorianCalendar now = new GregorianCalendar();
			logFile.printf("%TF %TT - %s %n", now, now, name);
			logFile.flush();//사용하여 바로 반영
		}
	}
	public void destroy() {
		if (logFile != null)
		logFile.close();
		}
}
