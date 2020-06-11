package app.nnn;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.net.URLCodec;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@SpringBootApplication
@RestController
public class NnnApplication {

	private final static String RESOURCE_DIR = "/home/kuraine/script-sketch/java/00076-java-spring-bootで質素なREST/upload-file";
	private final static Integer SUCCESS_STATUS = 0;
	private final static Integer FAIL_STATUS = 1;

	public static void main(String[] args) {
		SpringApplication.run(NnnApplication.class, args);
	}

	private static final String getFormHtml() {
		return "<p>リクエストを送信する</p>\n" + "    <form action=\"receive\" method=\"post\">\n"
				+ "        User: <input type=\"text\" name=\"user\" size=\"20\"><br />\n"
				+ "        Password: <input type=\"text\" name=\"password\" size=\"20\"><br />\n"
				+ "        <input type=\"submit\" value=\"Login\">\n" + "    </form>";
	}

	private static final String showIndexPage(String message) {
		String downloadList = "";

		List<String> fileList = showFileList(RESOURCE_DIR);

		if (fileList.size() == 0) {
			downloadList = "";
		}

		for (String file : fileList) {

			downloadList += "<form action=\"download\" method=\"post\">"
					+ "<input type=\"text\" name=\"downloadFileName\" value=\"" + file + "\" readonly>"
					+ "<input type=\"submit\" value=\"ダウンロードする\">" + "</form>";

		}

		return "<p>" + message + "</p>" + "<a href=\"./upload.html\">アップロードページへ移動する</a>" + downloadList;
	}

	private static List<String> showFileList(String searchDir) {

		File dir = new File(searchDir);
		if (!dir.exists()) {
			return new ArrayList<>();
		}

		List<String> rt = new ArrayList<>();
		File[] files = dir.listFiles();
		for (File file : files) {
			rt.add(file.getName());
		}
		return rt;
	}

	private Integer saveFile(InputStream inputStream, String uploadFileName) {

		int rtVal = SUCCESS_STATUS;

		File dir = new File(RESOURCE_DIR);

		if (!dir.exists()) {
			// ディレクトリが存在しない場合
			dir.mkdir();
		}

		try {
			OutputStream outputStream = new FileOutputStream(new File(uploadFileName));
			int read = 0;
			byte[] bytes = new byte[1024];
			outputStream = new FileOutputStream(new File(uploadFileName));
			while ((read = inputStream.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);
			}
			outputStream.flush();
			outputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
			rtVal = FAIL_STATUS;
		}
		return rtVal;
	}

	@PostMapping("/upload")
	public String upload(@RequestParam("file") MultipartFile multipartFile) {
		int rtVal = SUCCESS_STATUS;

		String uploadFileName = "";
		uploadFileName = RESOURCE_DIR + "/" + multipartFile.getOriginalFilename();// ファイル名の日本語対応

		System.out.println(uploadFileName);

		try {
			rtVal = saveFile(multipartFile.getInputStream(), uploadFileName);
		} catch (IOException e) {
			e.printStackTrace();
			rtVal = FAIL_STATUS;
		}

		if (rtVal == FAIL_STATUS) {
			return showIndexPage("アップロードが失敗しました");
		} else {
			return showIndexPage("アップロードが完了しました");
		}
	}

	
	//downloadがうまくいっていない
	@PostMapping("/download")
	public String download(@RequestBody String body, HttpServletResponse response) {

		int rtVal = SUCCESS_STATUS;

		System.out.println(body);

		String encodeDownloadFileName = body.replace("downloadFileName=", "");
		String decodeDownloadFileName = "";

		String downloadFileExtension = encodeDownloadFileName.substring(encodeDownloadFileName.indexOf(".") + 1);

		System.out.println(downloadFileExtension);

		URLCodec codec = new URLCodec("UTF-8");
		try {
			decodeDownloadFileName = codec.decode(encodeDownloadFileName, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
			rtVal = FAIL_STATUS;
		} catch (DecoderException e1) {
			e1.printStackTrace();
			rtVal = FAIL_STATUS;
		}

		System.out.println(decodeDownloadFileName); // %E3%81%86%E3%82%93%E3%81%93%E3%82%82%E3%82%8A%E3%82%82%E3%82%8A%E6%A3%AE%E9%B4%8E%E5%A4%96.txt

		// URLデコードしないとだめ日本語ファイル名など

		File file = new File(RESOURCE_DIR + "/" + decodeDownloadFileName);

		FileInputStream inputStream = null;
		ServletOutputStream outputStream = null;
		try {
			inputStream = new FileInputStream(file);
			outputStream = response.getOutputStream();
			FileCopyUtils.copy(inputStream, outputStream);
			outputStream.flush();
			inputStream.close();
			outputStream.close();
//			response.flushBuffer();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			rtVal = FAIL_STATUS;
		} catch (IOException e) {
			e.printStackTrace();
			rtVal = FAIL_STATUS;
		}

		switch (downloadFileExtension) {
		case "txt":
			response.setContentType("text/plain");
		case "md":
			response.setContentType("text/plain");
		case "pdf":
			response.setContentType("application/pdf");
		default:
			response.setContentType("application/octet");
		}

		response.setContentLength((int) file.length());
		response.setHeader("Content-Disposition", "attachment; filename=\"" + encodeDownloadFileName + "\"");

		if (rtVal == FAIL_STATUS) {
			return showIndexPage("ダウンロードが失敗しました");
		} else {
			return showIndexPage("ダウンロードが完了しました");
		}
	}

	@PostMapping("/receive")
	public String receive(@RequestBody String body) {
		System.out.println(body); // user=aine&password=aine%E3%81%AE%E3%83%91%E3%82%B9%E3%83%AF%E3%83%BC%E3%83%89

		// 疑似セッションIDを生成

		System.out.println(RandomStringUtils.randomAscii(32)); // echo "b?30A,ql!&dM"V@a?Eu;Mz2b0uL@9!(S" | awk '{print
																// length($0)}'

		// ユーザー情報とセッションIDを渡してインデックスページを表示
		return showIndexPage("ログインしました");

	}

	@GetMapping("/login")
	public String login() {
		return getFormHtml();
	}

}