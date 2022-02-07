package RentCar;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;


public class RentCarDAO {
    ResultSet rs; //데이터 베이스의 테이블의 결과를 리턴 받아 자바에 저장해 주는 객체
    Connection con;//데이터베이스에 접근할수 있도록 설정 
    PreparedStatement pstmt;//데이터 베이스에서 쿼리를 실행시켜주는 객체 
    
   public RentCarDAO()
    {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "bbj0504";
			String dbPassword = "123456";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con =DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
    }
    
   
    
    //최신순으로 3대의 자도차를 리턴하는 메소드 
    public Vector<CarList> getSelectCar(){
		//리턴 타입을 설정 
		Vector<CarList> v = new Vector<>();
		//커넥션이 연결되어야 쿼리를 실행가능 
		
    	try {
    		String sql = "select * from rentcar order by no desc";
    		pstmt = con.prepareStatement(sql);
    		//쿼리 실행후 결과를 Result 타입으로 리턴 
    		rs = pstmt.executeQuery();
    		int count= 0;
    		
    		while(rs.next()){
    			CarList bean = new CarList();
    			bean.setNo(rs.getInt(1));
    			bean.setName(rs.getString(2));
    			bean.setCategory(rs.getInt(3));
    			bean.setPrice(rs.getInt(4));
    			bean.setUsepeople(rs.getInt(5));
    			bean.setCompany(rs.getString(6));
    			bean.setImg(rs.getString(7));
    			bean.setInfo(rs.getString(8));
    			//벡터에 빈 클래스를 저장
    			v.add(bean);
    			count++;
    			if(count >= 3)break;//반복문을 빠져나가시오 
    			//3개만 벡터에 저장
    		}
    		//con.close();
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	return v;
    }
	
    //카테고르별 자동차 리스트를 저장하는 메소드 
    public Vector<CarList> getCategoryCar(int category) {
    	//리턴 타입을 설정 
		Vector<CarList> v = new Vector<>();
		//데이터를 저장할 빈 클래스 선언 
		CarList bean = null;
		
		//커넥션이 연결되어야 쿼리를 실행가능 
		
    	try {
    		String sql = "select * from rentcar where category = ?";
    		pstmt = con.prepareStatement(sql);
    		//?
    		pstmt.setInt(1,category);
    		
    		// 결과를 리턴
    		rs = pstmt.executeQuery();
    		
    		//반복문을 돌면서 데이터를 저장
    		while(rs.next()){
    			//데이터를 저장할 빈클래스 생성
    			bean = new CarList();
    			bean.setNo(rs.getInt(1));
    			bean.setName(rs.getString(2));
    			bean.setCategory(rs.getInt(3));
    			bean.setPrice(rs.getInt(4));
    			bean.setUsepeople(rs.getInt(5));
    			bean.setCompany(rs.getString(6));
    			bean.setImg(rs.getString(7));
    			bean.setInfo(rs.getString(8));
    			//벡터에 빈 클래스를 저장
    			v.add(bean);
    		}
    		//con.close();
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	return v;
    }
    
    
    //모든 차량을 검색하는 매소드
    public Vector<CarList> getAllCar(){
    	//리턴 타입을 설정 
		Vector<CarList> v = new Vector<>();
		//데이터를 저장할 빈 클래스 선언 
		CarList bean = null;
		
		
		
    	try {
    		String sql = "select * from rentcar";
    		pstmt = con.prepareStatement(sql);
    		
    		// 결과를 리턴
    		rs = pstmt.executeQuery();
    		
    		//반복문을 돌면서 데이터를 저장
    		while(rs.next()){
    			//데이터를 저장할 빈클래스 생성
    			bean = new CarList();
    			bean.setNo(rs.getInt(1));
    			bean.setName(rs.getString(2));
    			bean.setCategory(rs.getInt(3));
    			bean.setPrice(rs.getInt(4));
    			bean.setUsepeople(rs.getInt(5));
    			bean.setCompany(rs.getString(6));
    			bean.setImg(rs.getString(7));
    			bean.setInfo(rs.getString(8));
    			//벡터에 빈 클래스를 저장
    			v.add(bean);
    		}
    		//con.close();
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	return v;
    }

    //하나의 자동차 정보를 리턴하는 매소드
    public CarList getOneCar(int no){
    	//리턴 타입 선언 
    	CarList bean = new CarList();
 		
 		System.out.println("차량 번호"+no);
     	try {
     		String sql = "select * from rentcar where no = ?";
     		pstmt = con.prepareStatement(sql);
     		pstmt.setInt(1, no);
     		
     		// 결과를 리턴
     		rs = pstmt.executeQuery();
     		
     		//반복문을 돌면서 데이터를 저장
     		while(rs.next()){
     			bean = new CarList();
     			bean.setNo(rs.getInt(1));
     			bean.setName(rs.getString(2));
     			bean.setCategory(rs.getInt(3));
     			bean.setPrice(rs.getInt(4));
     			bean.setUsepeople(rs.getInt(5));
     			bean.setCompany(rs.getString(6));
     			bean.setImg(rs.getString(7));
     			bean.setInfo(rs.getString(8));
     		}
     		//con.close();
     	}catch (Exception e){
     		e.printStackTrace();
     	}
     	return bean;
    }
    
    
    public int getMember(String id,String pass) {
    	
    	int result=0;//0이면 회원 없음
    	
     	try {
     		String sql="select count(*) from member where id =? and pass =?";
     		pstmt = con.prepareStatement(sql);
     		pstmt.setString(1, id);
     		pstmt.setString(2, pass);
     		//결과 리턴
     		rs = pstmt.executeQuery();
     		
     		if(rs.next()){
     			result = rs.getInt(1);//0또는 1값이 저장됨
     		}
     		//con.close();
     	}catch (Exception e){
     		e.printStackTrace();
     	} 	
    	return result;		
    }
    
    
    
    //하나의 예약 정보를 저장하는 매소드 
    public void setReserveCar(CarReserve bean){
    	
     	try {
     		String sql="insert into CARRESERVE values(RESERVE_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?)";
     		pstmt = con.prepareStatement(sql);
     		//? 값을 대입     		
     		pstmt.setInt(1, bean.getNo());
     		pstmt.setString(2, bean.getId());
     		pstmt.setInt(3, bean.getQty());
     		pstmt.setInt(4, bean.getDday());
     		pstmt.setString(5, bean.getRday());
     		pstmt.setInt(6, bean.getUsein());
     		pstmt.setInt(7, bean.getUsewifi());
     		pstmt.setInt(8, bean.getUsenavi());
     		pstmt.setInt(9, bean.getUseseat());
     		
     		//결과 리턴
     		pstmt.executeUpdate();
     		//con.close();
     		
     	}catch (Exception e){
     		e.printStackTrace();
     	} 		
    }
    
    //회원의 예약 정보를 리턴하는 매소드 
    public Vector<CarView> getAllReserve(String id){
       	//리턴 타입을 설정 
    		Vector<CarView> v = new Vector<>();
    		//데이터를 저장할 빈 클래스 선언 
    		CarView bean = null;
    		
    		
    		
        	try {
        		//쿼리문
        		String sql = "select * from rentcar natural join carreserve where sysdate < to_date(rday,'YYYY-MM-DD') and id =?";
        		pstmt = con.prepareStatement(sql);
        		
        		//?
        		pstmt.setNString(1,id);
        		
        		// 결과를 리턴
        		rs = pstmt.executeQuery();
        		
        		//반복문을 돌면서 데이터를 저장
        		while(rs.next()){
        			//데이터를 저장할 빈클래스 생성
        			bean = new CarView();
        			bean.setName(rs.getString(2));
        			bean.setPrice(rs.getInt(4));
        			bean.setImg(rs.getString(7));
        			bean.setQty(rs.getInt(11));
        			bean.setDday(rs.getInt(12));
        			bean.setRday(rs.getString(13));
        			bean.setUserin(rs.getInt(14));
        			bean.setUsewifi(rs.getInt(15));
        			bean.setUsenavi(rs.getInt(16));
        			bean.setUseseat(rs.getInt(17));
        			//벡터에 빈 클래스를 저장
        			v.add(bean);
        		}
        		//con.close();
        	}catch (Exception e) {
        		e.printStackTrace();
        	}
        	return v;
    }
    
    //하나의 예약 삭제
    public void carRemoveReserve(String id, String rday) {
    	//리턴 타입 선언 
    	CarList bean = new CarList();
 		
 		
     	try {
     		String sql = "delete from carreserve where id=? and rday=?";
     		pstmt = con.prepareStatement(sql);
     		
     		//?
     		pstmt.setString(1, id);
     		pstmt.setString(2, rday);
     		
     		//쿼리 실행
     		pstmt.executeUpdate();
     		//con.close();
     	}catch (Exception e){
     		e.printStackTrace();
     	}
    }
    
    
    
}