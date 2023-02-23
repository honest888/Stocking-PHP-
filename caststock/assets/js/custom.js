function startTime() {
    var today = new Date();

    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();

    m = checkTime(m);
    s = checkTime(s);

    var am_pm = today.getHours() >= 12 ? "PM" : "AM";

    $('#current_time').text(h + ":" + m + ":" + s + ' ' + am_pm);

    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {
        i = "0" + i
    }
    ;  // add zero in front of numbers < 10
    return i;
}

function convert_date_string(dat) {
    if(dat > 9)
        return dat;
    else
        return "0"+dat;
}

$(function () {
    $(document).on('click', '.brand-link', function () {
        $("body").addClass("sidebar-collapse");
    });

    $(document).on('click', '.logout', function () {
        var session_key = $(this).val();
        window.location.href = "logout.php?session_key=" + session_key;
    });
});