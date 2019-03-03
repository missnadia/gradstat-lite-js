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
            $("div#comments-area").html("")
            var $comments = $("div#comments-area")
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
        url = this.action
        data = {
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

Comment.prototype.commentHTML = function () {
    return (`
    <li>${this.comment}</li>
    `)
}