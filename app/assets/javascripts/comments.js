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
<<<<<<< HEAD
            data["comments"].forEach(function (obj) {
=======
            $comments.html("")
            data.forEach(function (obj) {
>>>>>>> 1a84a3d59d5e03fdaf40a5159e0c7c6e5758c6b8
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
