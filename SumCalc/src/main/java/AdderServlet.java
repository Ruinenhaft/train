

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdderServlet
 */
@WebServlet("/AdderServlet")
public class AdderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String str1 = request.getParameter("num1");
		String str2 = request.getParameter("num2");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		try {
			int num1 = Integer.parseInt(str1);
			int num2 = Integer.parseInt(str2);
			int result = num1+num2;
			out.println("<html>");
			out.println("<head><title>덧셈프로그램</title></head>");
			out.println("<body>");
			out.printf("%d + %d = %d", num1, num2, result);
			out.println("</body>");
			out.println("</html>");
		}catch(NumberFormatException e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("data-error");
			dispatcher.forward(request, response);
		}
	}
}
