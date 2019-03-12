$(function () {
  getCourses();
  getNextCourse();
  sortCourses();
});

function getCourses() {
  $("button#load-course-log").on("click", function (e) {
    e.preventDefault();
    $.ajax({
      url: this.href,
      method: "GET",
      dataType: "json"
    }).done(function (data) {
      let courseData = $("div#ajax-course-data")
      courseData.html("");
      courseData.append(Course.courseTableHeader())
      data.forEach(function (obj) {
        let mycourse = new Course(obj);
        let myCourseHTML = mycourse.courseHTML()
        courseData.append(myCourseHTML)
      });
    });
  })
}

function getNextCourse() {
  $('button#next-course').on('click', function (e) {
    e.preventDefault()
    $('button#next-course').remove()
    let courseId = $(this).data('id')
    let url = '/courses/' + (courseId + 1)
    $.get(url + '.json', function (data) {
      let courseData = $("div#course-show-data")
      let courseColumn = $("div#course-show-header")
      courseColumn.html("");
      courseColumn.append(Course.courseTableHeader())
      let mycourse = new Course(data);
      let myCourseHTML = mycourse.courseHTML()
      courseData.replaceWith(myCourseHTML)
    })
  })
}

function sortCourses() {
  $('button#load-course-alpha').on('click', function (e) {
    e.preventDefault()
    $.ajax({
      url: "/courses",
      method: "GET",
      dataType: "json"
    }).done(function (data) {
      let courseData = $("div#ajax-course-data")
      courseData.html("");
      courseData.append(Course.courseTableHeader())
      const sortedCourses = data.sort(function (a, b) {
        var courseA = a.name.toUpperCase();
        var courseB = b.name.toUpperCase();
        if (courseA < courseB) {
          return -1;
        }
        if (courseA > courseB) {
          return 1;
        }
        return 0;
      });
      sortedCourses.forEach(function (obj) {
        let mycourse = new Course(obj);
        let myCourseHTML = mycourse.courseHTML()
        courseData.append(myCourseHTML)
      });
    });

  })
}

class Course {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name
    this.time_spent = obj.time_spent
    this.date = obj.date
    this.comments = obj.comments
  }

  static courseTableHeader() {
    return (`
    <tr>
      <th>Course</th>
      <th>Logged Hours</th>
      <th>Date</th>
    </tr>
    `)
  }
}

Course.prototype.courseHTML = function () {
  return (`
  <tr>
    <td><a href="/courses/${this.id}" id="course-link">${this.name}</a></td>
    <td>${this.time_spent}</td>
    <td>${this.date}</td>
  </tr>
  `);
};