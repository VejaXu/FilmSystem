package com.icss.framework.code;

import com.icss.framework.config.ManageConfig;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

public class CreateImageCode {

    //图片的宽度
    private int width=160;
    //图片的高度
    private int height=40;
    //验证码字符个数
    private int codeCount=4;
    //验证码干扰线数
    private int lineCount=3;
    //验证码
    private String code="";

    //验证码图片Buffer
    private BufferedImage buffImg=null;

    private Random random=new Random();

    public CreateImageCode(){creatImage();}

    public CreateImageCode(int width,int height){
        this.width=width;
        this.height=height;
        creatImage();
    }

    public CreateImageCode(int width,int height,int codeCount){
        this.width=width;
        this.height=height;
        this.codeCount=codeCount;
        creatImage();
    }

    public CreateImageCode(int width,int height,int codeCount,int lineCount){
        this.width=width;
        this.height=height;
        this.codeCount=codeCount;
        this.lineCount=lineCount;
        creatImage();
    }

    //生成验证码图片
    private void creatImage(){
        int fontWidth=width/codeCount; //字体的宽度
        int fontHeight=height-5;    //字体的高度
        int codeY=height-8;

        //图像buffer
        buffImg=new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
        Graphics graphics=buffImg.getGraphics();

        //设置背景色
        graphics.setColor(getRandColor(200,250));
        //绘制一个用当前颜色填充的3d高亮矩形
        graphics.fillRect(0,0,width,height);

        //Font设置图形用户界面上的字体样式的，包括字体类型
        Font font=new Font("Fixedsys",Font.BOLD,fontHeight);
        graphics.setFont(font);
        //设置干扰线
        for (int i=0;i<lineCount;i++){
            int xs=random.nextInt(width);
            int ys=random.nextInt(height);
            int xe=xs+random.nextInt(width);
            int ye=ys+random.nextInt(height);
            //设置干扰线颜色
            graphics.setColor(getRandColor(1,255));
            graphics.drawLine(xs,ys,xe,ye);
        }

        //添加噪点
        float yawRate=0.01f;//噪点率
        int area=(int) yawRate+width+height;
        for (int i=0;i<area;i++){
            int x=random.nextInt(width);
            int y=random.nextInt(height);
            buffImg.setRGB(x,y,random.nextInt(255));
        }
        //获取随机字符
        String str=randomStr(codeCount);
        this.code=str;
        for (int i=0;i<codeCount;i++) {
            String strRand = str.substring(i, i + 1);
            graphics.setColor(getRandColor(1, 255));
//            graphics.drawString(a,x,y);
//            a为要画出来的东西，x和y表示要画的东西最左侧字符的基线位于此图形上下文坐标系的(x,y)的位置处
            graphics.drawString(strRand,i*fontWidth+3,codeY);
        }
    }

    //生成随机验证码
    private String randomStr(int n){
        String str1="0123456789abcdefghjkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
        String str2="";
        int len=str1.length()-1;
        double r;
        for (int i=0;i<n;i++){
            r=(Math.random())*len;
            str2=str2+str1.charAt((int)r);
        }
        return str2;
    }

    //得到随机颜色
    private Color getRandColor(int fc,int bc){
        if (fc>255) fc=255; //颜色最大255
        if (bc>255) bc=255;
        int r=fc+random.nextInt(bc-fc);
        int g=fc+random.nextInt(bc-fc);
        int b=fc+random.nextInt(bc-fc);
        return new Color(r,g,b);
    }

    //    产生随机字体
    private Font getFont(int size){
        Random random1=new Random();
        Font font[]= new Font[5];
        font[0]=new Font("Ravie",Font.PLAIN,size);
        font[1]=new Font("Antigue olive Compact",Font.PLAIN,size);
        font[2]=new Font("Fixedsys",Font.PLAIN,size);
        font[3]=new Font("Wide Latin",Font.PLAIN,size);
        font[4]=new Font("Gill Sans Ultra Bold",Font.PLAIN,size);
        return font[random1.nextInt(5)];
    }

    public void write(OutputStream sos)throws IOException{
        ImageIO.write(buffImg,"png",sos);
        sos.close();
    }

    //    将验证码图片下载到本地
    public String writes()throws Exception{
        String name="/code/"+System.currentTimeMillis()+".png";
        String str=ManageConfig.getUploadPath();
        File file=new File(str+"/code/");
        if (!file.exists()) {
            file.mkdirs(); // 如果文件夹不存在，则创建文件夹
        }
        OutputStream out=new FileOutputStream(new File(ManageConfig.getUploadPath()+name));
        //抛出下载
        ImageIO.write(buffImg,"png",out);
        return name;
    }

    public String getCode(){
        return code;
    }
}
