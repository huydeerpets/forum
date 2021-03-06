package utils

import (
	//"fmt"
	"forum/models"
	"forum/utils"
	"time"

	"github.com/astaxie/beego"
	"github.com/russross/blackfriday"
	"github.com/xeonx/timeago"
)

func FormatTime(time time.Time) string {
	return timeago.Chinese.Format(time)
}

func Markdown(content string) string {
	//fmt.Println("会打印出html格式", string(blackfriday.MarkdownCommon([]byte(utils.NoHtml(content)))))
	return string(blackfriday.MarkdownCommon([]byte(utils.NoHtml(content))))
}

func HasPermission(userId int, name string) bool {
	return models.FindPermissionByUserIdAndPermissionName(userId, name)
}

func init() {
	beego.AddFuncMap("timeago", FormatTime)
	beego.AddFuncMap("markdown", Markdown)
	beego.AddFuncMap("haspermission", HasPermission)
}
