<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%@ attribute name="rank" required="true" type="java.lang.Double"%>
<%@ attribute name="width" required="true" type="java.lang.Integer"%>

<span width="${width}px">
    <span style="position: absolute;" width="${width}px">
        <div style="position: relative; top: 0px; left: 0px; overflow:hidden; width: ${rank*20}%;">
            <img width="${width}px" src="../source/img/star_yellow.png"></img>
        </div>
    </span>
    <img width="${width}px" src="../source/img/star_gray.png"></img>
</span>

