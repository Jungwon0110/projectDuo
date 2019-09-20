<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<title>ProjectDuo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://kit.fontawesome.com/1b10eafc75.js"></script>
<link rel="stylesheet" href="/css/button.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/portfolio.css">
<jsp:include page="bootStrap.jsp"></jsp:include>
<style>
.col-md-7 input[type=text],textarea{
   margin-top : 10px;
   width : 80%;
}
</style>
<body>
   <jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<form id="portfolioInsert" action="/portfolioInsertProc">
		<h1 class="my-4">
			<input type="text" name="portfolioTitle" autocomplete="off" placeholder="Title" required/>
		</h1>
	
		<div class="row">
		<div class="col-md-7">
		         <h1><small><input type="text" name="teamName" autocomplete="off" placeholder="teamName" required/></small></h1>
		         <!-- 파일업로드 -->
		<img style="max-height: 500px; max-width: 500px;" id=image src=""> 
		<input id="imageUpload" type="hidden" name="mainImage" value="" required> 
		<input class="upload-name" value="파일선택" disabled="disabled" required> 
		<label for="file" class="customButton">업로드</label>
		<input style="display: none" type="file" id=file class="upload-hidden" required><br>
		<!-- 파일업로드 -->
		   <input type="text" name="githubRepo" autocomplete="off" placeholder="github Repository" required/><br>
		   <input type="text" name="pageUrl" autocomplete="off" placeholder="page url" required/><br>
		   <input type="text" name="youtubeUrl" autocomplete="off" placeholder="youtube url" required/><br><br>
		   <label>Start Time : </label>
		   <input type="date" name="startTime" required/>&nbsp;
		   <label>  End Time : </label>
		   <input type="date" name="endTime" required/><br><br>
		   <label><b>공개여부</b></label><br>
		   <label>공개</label>
		   <input type="radio" name="visible" value="1">&nbsp;
		   <label>비공개</label>
		   <input type="radio" name="visible" value="0" >
		</div>
	
		<div class="col-md-5">
		   <h3 class="my-3">Project Description</h3>
		   <textarea rows="5" cols="50" name="summary"  placeholder="Description"></textarea>
		   <h3 class="my-3">Project Member</h3>
		   <ul>
		      <li>Leader : </li><input type="text" name="leader"><br>
		      <li style="list-style: none;"><b>Member</b></li>
		          <li>Dolor Sit Amet</li>
		          <li>Consectetur</li>
		          <li>Adipiscing Elit</li>
		       </ul>
		    </div>
		 </div>

		 <div class="container">
		        <div class="header">
		            <h1>사진 첨부</h1>
		        </div>
		        <div class="body">
		            <!-- 미리보기 영역 -->
					<div id="preview" class="content"></div>
					
				     <!-- 첨부 버튼 -->
		            <div id="attach">
		                <button type="button" class="customButton" ><label style="margin:auto" class="waves-effect waves-teal btn-flat" for="uploadInputBox">사진첨부</label></button>
		                <input id="uploadInputBox" style="display: none" type="file" name="filedata" multiple />
		            </div>   
		            <!-- multipart 업로드시 영역 -->
		            <form id="uploadForm" style="display: none;" ></form>
		        </div>
		            
		    </div>
    
		<div>
			<button type="button" onclick="uploadImage()" class="customButton" style="margin-bottom:20px;float:right">Upload</button>
		</div>
	</form>   
</div>
   
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script type="text/javascript">
      /* 이미지 업로드 */
      var file = document.getElementById('file');
      var image = document.getElementById('image');
      var imageValue = document.getElementById('imageUpload');
      
      file.onchange = function(event) {
         var target = event.currentTarget;
         var xmlHttpRequest = new XMLHttpRequest();
         xmlHttpRequest.open('POST', 'https://api.imgur.com/3/image/', true);
         xmlHttpRequest.setRequestHeader("Authorization",
               "Client-ID 4a1ce5627a35af1");
         xmlHttpRequest.onreadystatechange = function() {
            if (xmlHttpRequest.readyState == 4) {
               if (xmlHttpRequest.status == 200) {
                  var result = JSON.parse(xmlHttpRequest.responseText);
                  image.src = result.data.link;
                  imageValue.value = result.data.link;
                  console.log(result);
               } else {
                  alert("업로드 실패");
                  image.src = "http://dy.gnch.or.kr/img/no-image.jpg";
               }
            }
         };
         xmlHttpRequest.send(target.files[0]);
         image.src = "https://nrm.dfg.ca.gov/images/image-loader.gif";
      };

      /* 이미지 삭제 */
      function deleteImage() {
         image.src = "http://dy.gnch.or.kr/img/no-image.jpg";
         imageValue.value = "http://dy.gnch.or.kr/img/no-image.jpg";
      }

      /* 업로드 폼 변경 */
      $(document).ready(
            function() {
               var fileTarget = $('.upload-hidden');

               fileTarget.on('change', function() {
                  if (window.FileReader) {
                     var filename = $(this)[0].files[0].name;
                  } else {
                     var filename = $(this).val().split('/').pop()
                           .split('\\').pop();
                  }

                  $(this).siblings('.upload-name').val(filename);
         });
	       $('#attach input[type=file]').change(function() {
	           addPreview($(this)); //preview form 추가하기
	       });
      });


      //임의의 file object영역
      var files = {};
      var previewIndex = 0;

      // image preview 기능 구현
      // input = file object[]
      function addPreview(input) {
          if (input[0].files) {
              //파일 선택이 여러개였을 시의 대응
              for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                  var file = input[0].files[fileIndex];

                  if (validation(file.name))
                      continue;

                  var reader = new FileReader();
                  reader.onload = function(img) {
                      //div id="preview" 내에 동적코드추가.
                      //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
                      var imgNum = previewIndex++;
                      $("#preview")
                              .append(
                                      "<form id=\"fileNum"+imgNum+"\" action=\"/portfolioFileInsertProc/"+imgNum+"\" method=\"POST\">"
                                      +"<div class=\"row imageContents\" value=\""+imgNum +"\"><div class=\"preview-box col-md-7\" value=\"" + imgNum +"\">"
                                              + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
                                              + "<input id=\"imageUpload"+ imgNum +"\" type=\"hidden\" name=\"my_image\" value=\""+img.target.result+"\">"
                                              + "<p>"
                                              + file.name
                                              + "</p>"
                                              + "<a href=\"#\" value=\""
                                              + imgNum
                                              + "\" onclick=\"deletePreview(this)\">"
                                              + "삭제" + "</a>" 
                                              + "</div>"
                                              + "<div class=\"col-md-5\" value=\"" + imgNum +"\">"
                  				   			+ "<h3><input type=\"text\" class=\"form-control\" name=\"photoName"
                  				   			+"\"required=\"required\" placeholder=\"사진제목\"></h3>" 
                  				   			+ "<textarea class=\"form-control\" name=\"photoDescription"
                  				   			+"\" rows=\"5\" required=\"required\" placeholder=\"사진설명\"></textarea>"
                  				   			+ "</div></div></form>");
                      files[imgNum] = file;
                  };
                  reader.readAsDataURL(file);
              }
          } else
              alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
      }

		//등록 버튼 눌렀을 때 파일 저장
      function uploadImage(){
          $.post({
              type:'POST',
              url:'/portfolioInsertProc',
              data: $("form[id=portfolioInsert]").serialize(),
              success:function(){
            	  for(var i = 0; i <Object.keys(files).length; i++){
 		             var searchId="imageUpload"+Object.keys(files)[i];
 		             var queryString = $("form[id=fileNum"+Object.keys(files)[i]+"]").serialize()
 		             $.ajax({
 							type : 'POST',
 							url:'/portfolioFileInsertProc/'+Object.keys(files)[i],
 							async:true,
 							data:queryString
 		             });
 		          }
            	  location.href="/portfolio"
              }
          })
		}

      //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
      function deletePreview(obj) {
          var imgNum = obj.attributes['value'].value;
          delete files[imgNum];
          $("#preview .preview-box[value=" + imgNum + "]").remove();
          $("#preview .col-md-5[value=" + imgNum + "]").remove();
          $("#preview .imageContents[value=" + imgNum + "]").remove();
          resizeHeight();
      }

      //client-side validation
      //always server-side validation required
      function validation(fileName) {
          fileName = fileName + "";
          var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
          var fileNameExtension = fileName.toLowerCase().substring(
                  fileNameExtensionIndex, fileName.length);
          if (!((fileNameExtension === 'jpg')
                  || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
              alert('jpg, gif, png 확장자만 업로드 가능합니다.');
              return true;
          } else {
              return false;
          }
      }
      
   </script>
   
</body>
</html>