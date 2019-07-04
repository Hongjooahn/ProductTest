package product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
		DBConnectionMgr mgr;
		ResultSet rs;
		public ProductDAO() {
			mgr = DBConnectionMgr.getInstance();
		}

		public void insert(ProductDTO dto) throws Exception {

			Connection con = mgr.getConnection();

			String sql = "insert into Product values(default,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1,dto.getTitle());
			ps.setString(2,dto.getEx());
			ps.setInt(3,dto.getPrice());
			ps.executeUpdate();
			
			mgr.freeConnection(con, ps);

		}

		
		public ArrayList<ProductDTO> selectAll() throws Exception {
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			Connection con = mgr.getConnection();

			String sql = "select * from Product ORDER BY id DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				int id = rs.getInt(1);
				String title = rs.getString(2);
				String ex = rs.getString(3);
				int price = rs.getInt(4);
				

				dto.setId(id);
				dto.setTitle(title);
				dto.setEx(ex);
				dto.setPrice(price);
				
				list.add(dto);
			}
			mgr.freeConnection(con, ps, rs);
			return list;
		}
		
		public void delete(int num) throws Exception {

			Connection con = mgr.getConnection();
			
			String sql = "delete from Product where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		
			mgr.freeConnection(con, ps);
		}
		
		public ArrayList<ProductDTO> select(int search) throws Exception {
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			Connection con = mgr.getConnection();

			String sql = "SELECT * FROM Product WHERE id = ?"; 
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, search);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				int id = rs.getInt(1);
				String title = rs.getString(2);
				String ex = rs.getString(3);
				int price = rs.getInt(4);
				
				dto.setId(id);
				dto.setTitle(title);
				dto.setEx(ex);
				dto.setPrice(price);
				
				list.add(dto);
			}
			mgr.freeConnection(con, ps, rs);
			return list;
		}
		
	}
	

