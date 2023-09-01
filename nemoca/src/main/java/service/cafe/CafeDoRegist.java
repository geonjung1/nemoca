package service.cafe;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.CafeRegistDao;
import model.Cafe;
import service.CommandProcess;

public class CafeDoRegist implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 1.화면에서 입력한 카페 정보를 서버에서 파라미터 수신한다.
		String realPath = request.getSession().getServletContext().getRealPath("/images");
//		String sourcePath = "C:/RDS/workspace/nemoca/src/main/webapp/images";
		int maxSize = 1024 * 1024 * 10; // 최대 사이즈 (10mb)
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String c_name = mr.getParameter("c_name");
		String c_addr = mr.getParameter("c_addr");
		String c_addr_new = mr.getParameter("c_addr_new");
		String c_loc = mr.getParameter("c_loc");
		String c_tel = mr.getParameter("c_tel");
		String c_price = mr.getParameter("c_price");
		String c_optime = mr.getParameter("c_optime");
		String user_id = mr.getParameter("user_id");


		// 2. 카페번호를 따준다
		//    > 상세로직 : db에서 카페테이블에 등록되어져있는 가장큰 카페번호를 가저와서 +1 한다
		//              db에서 카페테이블에 등록되어져있는 데이터가 없는경우, 1로 정한다
		CafeRegistDao crd = CafeRegistDao.getInstance();
		Integer c_no = crd.selectMaximumCafeNumber();
		if(c_no == null)
			c_no = Integer.parseInt("1");
		else
			c_no++;
		
		
		// 3.저장할 정보를 DTO에 담는다.
		Cafe cafe = new Cafe();
		cafe.setC_no(c_no);
		cafe.setC_name(c_name);
		cafe.setC_addr(c_addr);
		cafe.setC_addr_new(c_addr_new);
		cafe.setC_loc(c_loc);
		cafe.setC_tel(c_tel);
		cafe.setC_price(c_price);
		cafe.setC_optime(c_optime);
		cafe.setUser_id(user_id);
		
		
		// 4. File 이미지 정보 변경
		String fileName, uploadFileName, changeFileName, sourceFileName; 
		String fileExtend;
		File uploadIamgeFile, changeIamgeFile, sourceImageFile;
		for(int i=1; i<=5; i++) {
			fileName = mr.getFilesystemName("thumbnail_" + i);
			if(fileName != null && fileName.length() > 0) {
				uploadFileName = mr.getFilesystemName("thumbnail_" + i);
				uploadIamgeFile = new File(realPath + "/" + uploadFileName);
				
				fileExtend = uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1);
				
				changeFileName = c_no + "_" + i + "." + fileExtend;
				changeIamgeFile = new File(realPath + "/" + changeFileName);
				
				if(changeIamgeFile.exists())
					changeIamgeFile.delete();
				
				uploadIamgeFile.renameTo(changeIamgeFile);
				
				
//				sourceFileName = changeFileName;
//				sourceImageFile = new File(sourcePath + "/" + sourceFileName);
//				
//				FileInputStream inputStream = null;
//				FileOutputStream outputStream = null;
//				FileChannel fcin = null;
//				FileChannel fcout = null;
//				try {
//					//스트림 생성
//					inputStream = new FileInputStream(changeIamgeFile);
//					outputStream = new FileOutputStream(sourceImageFile);
//					
//					//채널 생성
//					fcin = inputStream.getChannel();
//					fcout = outputStream.getChannel();
//					
//					//채널을 통한 스트림 전송
//					long size = fcin.size();
//					fcin.transferTo(0, size, fcout);
//				} catch (Exception e) {
//					e.printStackTrace();
//				} finally {
//					//자원 해제
//					try{
//						fcout.close();
//					}catch(IOException ioe){}
//					
//					try{
//						fcin.close();
//					}catch(IOException ioe){}
//					
//					try{
//						outputStream.close();
//					}catch(IOException ioe){}
//					
//					try{
//						inputStream.close();
//					}catch(IOException ioe){}
//				}
			} else {
				changeFileName = " ";
			}
			
			if(i == 1)
				cafe.setC_img1(changeFileName);
			else if(i == 2)
				cafe.setC_img2(changeFileName);
			else if(i == 3)
				cafe.setC_img3(changeFileName);
			else if(i == 4)
				cafe.setC_menu1(changeFileName);
			else if(i == 5)
				cafe.setC_menu2(changeFileName);
		}
		cafe.setC_menu3(" ");
		
		
		// 5.DAO 에서 저장로직을 호출한다.
		int result = crd.insertCafe(cafe);
		request.setAttribute("result", result);
		
		
		// 6.결과 페이지로 이동한다.
		return "cafeRegistResult";
	}

}