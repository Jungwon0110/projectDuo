<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>�̹��� ÷��</title>
 
<style>
#preview img {
    width: 100px;
    height: 100px;
}
#preview p {
    text-overflow: ellipsis;
    overflow: hidden;
}
.preview-box {
    border: 1px solid;
    padding: 5px;
    border-radius: 2px;
    margin-bottom: 10px;
}
</style>
</head>
 
<body>
    <div class="wrapper">
        <div class="header">
            <h1>���� ÷��</h1>
        </div>
        <div class="body">
            <!-- ÷�� ��ư -->
            <div id="attach">
                <label class="waves-effect waves-teal btn-flat" for="uploadInputBox">����÷��</label>
                <input id="uploadInputBox" style="display: none" type="file" name="filedata" multiple />
            </div>
            
            <!-- �̸����� ���� -->
            <div id="preview" class="content"></div>
            
            <!-- multipart ���ε�� ���� -->
            <form id="uploadForm" style="display: none;" />
        </div>
        <div class="footer">
            <button class="submit"><a href="#" title="���" class="btnlink">���</a></button>
        </div>
    </div>
    
    
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script> -->
    <script>
        //������ file object����
        var files = {};
        var previewIndex = 0;
 
        // image preview ��� ����
        // input = file object[]
        function addPreview(input) {
            if (input[0].files) {
                //���� ������ ���������� ���� ����
                for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                    var file = input[0].files[fileIndex];
 
                    if (validation(file.name))
                        continue;
 
                    var reader = new FileReader();
                    reader.onload = function(img) {
                        //div id="preview" ���� �����ڵ��߰�.
                        //�� �κ��� �����ؼ� �̹��� ��ũ �� ���ϸ�, ������ ���� �ΰ������� �� �� ���� ���̴�.
                        var imgNum = previewIndex++;
                        $("#preview")
                                .append(
                                        "<div class=\"preview-box\" value=\"" + imgNum +"\">"
                                                + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
                                                + "<p>"
                                                + file.name
                                                + "</p>"
                                                + "<a href=\"#\" value=\""
                                                + imgNum
                                                + "\" onclick=\"deletePreview(this)\">"
                                                + "����" + "</a>" + "</div>");
                        files[imgNum] = file;
                    };
                    reader.readAsDataURL(file);
                }
            } else
                alert('invalid file input'); // ÷��Ŭ�� �� ��ҽ��� ����å�� ������ �ʾҴ�.
        }
 
        //preview �������� ���� ��ư Ŭ���� �ش� �̸������̹��� ���� ����
        function deletePreview(obj) {
            var imgNum = obj.attributes['value'].value;
            delete files[imgNum];
            $("#preview .preview-box[value=" + imgNum + "]").remove();
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
                alert('jpg, gif, png Ȯ���ڸ� ���ε� �����մϴ�.');
                return true;
            } else {
                return false;
            }
        }
 
        $(document).ready(function() {
            //submit ���. ������ submit type�� �ƴϴ�.
            $('.submit a').on('click',function() {                        
                var form = $('#uploadForm')[0];
                var formData = new FormData(form);
    
                for (var index = 0; index < Object.keys(files).length; index++) {
                    //formData ������ files��� �̸����� ������ �߰��Ѵ�.
                    //���ϸ����� ��� �߰��� �� �ִ�.
                    formData.append('files',files[index]);
                }
 
                //ajax ������� multipart form�� �����Ѵ�.
                $.ajax({
                    type : 'POST',
                    enctype : 'multipart/form-data',
                    processData : false,
                    contentType : false,
                    cache : false,
                    timeout : 600000,
                    url : '/imageupload',
                    dataType : 'JSON',
                    data : formData,
                    success : function(result) {
                        //�� �κ��� �����ؼ� �پ��� �ൿ�� �� �� ������,
                        //���⼭�� �����͸� ���۹޾Ҵٸ� �����ϰ� OK ���� ������� �Ͽ���.
                        //-1 = �߸��� Ȯ���� ���ε�, -2 = �뷮�ʰ�, �׿� = ����(1)
                        if (result === -1) {
                            alert('jpg, gif, png, bmp Ȯ���ڸ� ���ε� �����մϴ�.');
                            // ���� ���� ...
                        } else if (result === -2) {
                            alert('������ 10MB�� �ʰ��Ͽ����ϴ�.');
                            // ���� ���� ...
                        } else {
                            alert('�̹��� ���ε� ����');
                            // ���� ���� ...
                        }
                    }
                    //���۽��п����� �ڵ鸵�� ������� ����
                });
            });
            // <input type=file> �±� ��� ����
            $('#attach input[type=file]').change(function() {
                addPreview($(this)); //preview form �߰��ϱ�
            });
        });
    </script>
</body>
</html>
