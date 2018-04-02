package cn.obanks.ar.utils;
import java.io.File;
import org.springframework.web.multipart.MultipartFile;

public class UploadUtil {
	/**
	 * 保存文件
	 * 
	 * @param file
	 * @return boolean
	 * @author z4812098
	 */
	private boolean saveFile(MultipartFile file, String uploadURL) throws Exception {
		// 判断文件是否为空
		if (!file.isEmpty()) {
			try {
				// 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
				// )
				/*
				 * String filePath =
				 * request.getSession().getServletContext().getRealPath("/") +
				 * "upload/" + file.getOriginalFilename();
				 */
				File saveDir = new File(uploadURL + "/" + file.getOriginalFilename());
				if (!saveDir.getParentFile().exists()) saveDir.getParentFile().mkdirs();
				// 转存文件
				file.transferTo(saveDir);
				System.out.println(saveDir.getAbsolutePath() + "******" + saveDir.getPath());
				return true;
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	/**
	 * 上传图片
	 * 
	 * @param myfiles
	 * @return boolean
	 * @author z4812098
	 * @throws Exception
	 */
	public boolean filesUpload(MultipartFile[] myfiles, String uploadURL) throws Exception {
		if (myfiles != null && myfiles.length > 0) {
			for (int i = 0; i < myfiles.length; i++) {
				MultipartFile file = myfiles[i];
				if (file.getSize() > 2097152) throw new Exception("上传文件不能大于2M");
				// 保存文件
				saveFile(file, uploadURL);
			}
		}
		return true;
	}

	public boolean filesUpload(MultipartFile file, String uploadURL, String name) throws Exception {
		if (file.getSize() > 2097152) throw new Exception("上传文件不能大于2M");
		// 保存文件
		if (!file.isEmpty()) {
			try {
				// 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
				// )
				/*
				 * String filePath =
				 * request.getSession().getServletContext().getRealPath("/") +
				 * "upload/" + file.getOriginalFilename();
				 */
				File saveDir = new File(uploadURL + "/" + name);
				if (!saveDir.getParentFile().exists()) saveDir.getParentFile().mkdirs();
				// 转存文件
				file.transferTo(saveDir);
				System.out.println(saveDir.getAbsolutePath() + "******" + saveDir.getPath());
				return true;
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return true;
	}
}
