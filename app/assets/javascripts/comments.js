$(function () {
    getComments()
    postComment()
})

function getComments() {
    $("button.load-comments").on("click", function (e) {
        e.preventDefault()
        $.ajax({
            url: this.href,
            method: "GET",
            dataType: "json"
        }).done(function (data) {
            var $comments = $("div#comments-area")
            $comments.html("")
            data["comments"].forEach(function (obj) {
                let comment = new Comment(obj)
                $comments.append(comment.commentHTML())
            })
        })
    })
}

function postComment() {
    $("form#new_comment.new_comment").on("submit", function (e) {
        e.preventDefault()
        const url = this.action
        const data = {
            'authenticity_token': $("input[name='authenticity_token']").val(),
            'comment': {
                'comment': $("#comment_comment").val()
            }
        }
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            success: function (response) {
                $("div#comments-area").append(response)
            }
        })
    })
}

class Comment {
    constructor(obj) {
        this.id = obj.id
        this.comment = obj.comment
        this.course_id = obj.course_id
        this.student_id = obj.student_id
    }
}

// ES5
// function Comment(obj) {
//     this.id = obj.id
//     this.comment = obj.comment
//     this.courseId = obj.course_id
//     this.studentId = obj.student_id
// }

Comment.prototype.commentHTML = function () {
    return (`
    <li>${this.comment}</li>
    `)
}