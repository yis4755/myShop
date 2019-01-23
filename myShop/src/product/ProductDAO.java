package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
	 DBConnectionMgr pool;
	 Connection con;
	   
	 public ProductDAO() {
		 pool = DBConnectionMgr.getInstance();
	}
	 
	// 상품 등록
	public void insert(ProductDTO dto) throws Exception {
		
		PreparedStatement ps;
		
		con = pool.getConnection();
		
		String sql = "insert into product values (?, ?, ?, ?);";
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getTitle());
		ps.setString(3, dto.getContent());
		ps.setString(4, dto.getPrice());
		ps.executeUpdate();
		
		System.out.println("실행 완료");
		
		pool.freeConnection(con, ps);
	}
	
	// 상품 수정
	public void update(ProductDTO dto) throws Exception {
		PreparedStatement ps;
		
		con = pool.getConnection();
		
		String sql = "update product set content=?, price=? where id=?;";
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getContent());
		ps.setString(2, dto.getPrice());
		ps.setString(3, dto.getId());
		ps.executeUpdate();
		
		System.out.println("실행 완료");
		
		pool.freeConnection(con, ps);
	}
	
	// 상품 삭제
	public void delete(String id) throws Exception {
		
		PreparedStatement ps;
		
		con = pool.getConnection();
		
		String sql = "delete from product where id = ?;";
		ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.executeUpdate();
		
		System.out.println("실행 완료");
		
		pool.freeConnection(con, ps);
	}
	
	// 상품 검색
	public ArrayList<ProductDTO> select(String id) throws Exception {
		PreparedStatement ps;
		ResultSet rs;
		ProductDTO dto;
		
		con = pool.getConnection();
		
		String sql = "select * from product where id like '%" + id + "%';";
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		
		ArrayList<ProductDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			dto = new ProductDTO();
			
			dto.setId(rs.getString("id"));
			dto.setTitle(rs.getString("title"));;
			dto.setContent(rs.getString("content"));
			dto.setPrice(rs.getString("price"));
			
			list.add(dto);
		}
		
		System.out.println("실행 완료");
		
		pool.freeConnection(con, ps, rs);
		
		return list;
	}
	
	// 상품 전체 리스트 출력
	public ArrayList<ProductDTO> selectAll() throws Exception {
		PreparedStatement ps;
		ResultSet rs;
		ProductDTO dto;
		
		con = pool.getConnection();
		
		String sql = "select * from product;";
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		
		ArrayList<ProductDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			dto = new ProductDTO();
			
			dto.setId(rs.getString("id"));
			dto.setTitle(rs.getString("title"));;
			dto.setContent(rs.getString("content"));
			dto.setPrice(rs.getString("price"));
			
			list.add(dto);
		}
		
		System.out.println("실행 완료");
		
		pool.freeConnection(con, ps, rs);
		
		return list;
	}
}	
