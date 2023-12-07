package com.example.jspcrud.util;

import com.example.jspcrud.dao.BoardDAO;
import com.example.jspcrud.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;


public class FileUpload {
    public BoardVO uploadPhoto(HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");
        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        BoardVO one = null;
        MultipartRequest multipartRequest = null;
        try {
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit,
                    "utf-8", new DefaultFileRenamePolicy());
            filename = multipartRequest.getFilesystemName("photo");

            one = new BoardVO();
            String sid = multipartRequest.getParameter("seq");
            if (sid != null && !sid.equals("")) one.setSeq(Integer.parseInt(sid));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setMbti(multipartRequest.getParameter("mbti"));
            one.setContacts(multipartRequest.getParameter("contacts"));
            one.setComment(multipartRequest.getParameter("comment"));
            one.setPhoto(multipartRequest.getParameter("photo"));


            if (sid != null && !sid.isEmpty()) {
                BoardDAO dao = new BoardDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
                if (filename != null && oldfilename != null) FileUpload.deleteFile(request, oldfilename);
                else if (filename == null && oldfilename != null) filename = oldfilename;
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
        if (f.exists()) f.delete();
    }
}
