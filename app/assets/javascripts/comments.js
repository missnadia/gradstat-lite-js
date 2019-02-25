$(function () {
    getComments()
    addComment()
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
            data.forEach(function (obj) {
                let comment = new Comment(obj)
                $comments.append(comment.commentHTML())
            })
        })
    })
}

function addComment() {
    $("button#add-comment").on("click", function (e) {
        e.preventDefault()
        let newCommentForm = Comment.newCommentForm()
        document.querySelector("div#ajax-comment-form").innerHTML = newCommentForm
    })
}

class Comment {
    constructor(obj) {
        this.id = obj.id
        this.comment = obj.comment
        this.course_id = obj.course_id
        this.student_id = obj.student_id
    }

    static newCommentForm() {
        return (`
        <form id="new-comment-form">
            <input type="text" name="comment-body"></input>
            <input id="submitComment" type="submit" value="Add Comment">
        </form>
        `)
    }
}

Comment.prototype.commentHTML = function () {
    return (`
        <p>${this.comment}</p><br>
    `)
}