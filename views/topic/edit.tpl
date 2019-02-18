<div class="row">
  <div class="col-md-9">
    <div class="panel panel-default">
      <div class="panel-heading">
        <a href="/">主页</a> / 编辑话题
      </div>
      <div class="panel-body">
        {{template "../components/flash_error.tpl" .}}
        <form method="post" action="/topic/edit/{{.Topic.Id}}">
          <div class="form-group">
            <label for="title">标题</label>
            <input type="text" class="form-control" id="title" name="title" value="{{.Topic.Title}}" placeholder="标题">
          </div>
          <div class="form-group">
            <label for="title">内容</label>

            <textarea class="form-control "  id='content' name="content" data-provide="markdown-editable"  style='color:#000' rows="15">{{.Topic.Content}}</textarea>
          </div>
          <div class="form-group">
            <label for="title">版块</label>
            <select name="sid" id="sid" class="form-control">
              {{range .Sections}}
                <option value="{{.Id}}">{{.Name}}</option>
              {{end}}
            </select>
          </div>
          <button type="submit" class="btn btn-default">发布</button>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  $(function () {
    $("#sid").val('{{.Topic.Section.Id}}')
  });
</script>


<script type="text/javascript">
//显示中文提示
    (function ($) {
      $.fn.markdown.messages.zh = {
        'Bold': "粗体",
	    'Italic': "斜体",
        'Heading': "标题",
        'URL/Link': "链接",
        'Image': "图片",
        'List': "列表",
        'Unordered List': "无序列表",
        'Ordered List': "有序列表",
        'Code': "代码",
        'Quote': "引用",
        'Preview': "预览",
        'strong text': "粗体",
        'emphasized text': "强调",
        'heading text': "标题",
        'enter link description here': "输入链接说明",
        'Insert Hyperlink': "URL地址",
        'enter image description here': "输入图片说明",
        'Insert Image Hyperlink': "图片URL地址",
        'enter image title here': "在这里输入图片标题",
        'list text here': "这里是列表文本",
        'code text here': "这里输入代码",
        'quote here': "这里输入引用文本"
      };
    }(jQuery));
    //初始化编辑器
var $editor = $("#content");
    $editor.markdown({
      autofocus: true,
      language: 'zh',
      height:500,
  dropZoneOptions:{
            paramName:'markdownImage',//上传的图片name值
            maxFilesize: 4,//M
            uploadMultiple:false,
            createImageThumbnails:true,//是否生成图像的缩略图
            url:'/ss',
        }

        });
</script>


<script type="text/javascript">
$(".content img").addClass('img-responsive');
</script>

<form id ="myAwesomeDropzone" action="/ss" class="dropzone" method="POST" enctype="multipart/form-data"></form>