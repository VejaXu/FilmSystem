package com.icss.project.common;

import com.icss.common.constant.Constants;
import com.icss.common.exception.ServiceException;
import com.icss.common.utils.StringUtils;
import com.icss.framework.config.ManageConfig;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.FileInputStream;
import java.io.IOException;

/**
 * 文件controller
 * @author xytmq
 */
@RestController
public class FileController {

    @GetMapping("/profile/**")
    public void getFileContent(HttpServletRequest request, HttpServletResponse response){
        String uri = request.getRequestURI();
        String filePath = StringUtils.substringAfter(uri, Constants.RESOURCE_PREFIX);
        String path = ManageConfig.getProfile()+filePath;
        try {
//            response.setHeader("Content-Disposition", "attachment;filename=" + path);
            FileInputStream fileInputStream = new FileInputStream(path);
            byte[] bytes = new byte[fileInputStream.available()];
            fileInputStream.read(bytes);
            fileInputStream.close();
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(bytes);
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            throw new ServiceException(e.getMessage());
        }
    }
}
