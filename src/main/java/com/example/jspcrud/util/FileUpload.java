package com.example.jspmyboard.util;

import com.example.jspmyboard.dao.BoardDAO;
import com.example.jspmyboard.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.File;


public class FileUpload {
    public BoardVO uploadPhoto(HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");
        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();

        BoardVO one = null;
        MultipartRequest multipartRequest= null;
        try {
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit,
                    "utf-8", new DefaultFileRenamePolicy());
            filename = multipartRequest.getFilesystemName("photo");

            one = new BoardVO();
            String sid = multipartRequest.getParameter("seq");
            if(sid!=null&& !sid.equals("")) one.setSeq(Integer.parseInt(sid));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setMbti(multipartRequest.getParameter("mbti"));
            one.setContent(multipartRequest.getParameter("content"));
            one.setPhoto(multipartRequest.getParameter("photo"));
            one.setInfo(multipartRequest.getParameter("info"));

            if(sid != null && !sid.isEmpty()) {
                BoardDAO dao = new BoardDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
                if(filename!=null && oldfilename!=null) FileUpload.deleteFile(request, oldfilename);
                else if(filename == null && oldfilename != null) filename = oldfilename;
            }
            one.setPhoto(filename);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename) {
        String filePath = request.getServletContext().getRealPath("upload");
        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }
}
