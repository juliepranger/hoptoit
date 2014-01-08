function organizationSearch() {
  var offset = 0;

  $('#nameBox').keypress(function() {
    var length = $('#nameBox').val().length;
    offset = 0;
    $('.charityReturns table').html('');
    if (length >= 3) {
      getJson();
    }
  });
  // when the window is scrolled...
  $(window).scroll(loadMore);
  // get more charities from the db. (hardcoded to 20 at a time)
  function loadMore() {
    var win = $(window);
    if (win.height() + win.scrollTop() >= $(document).height()) {
      offset += 20;
      getJson();
    }
  }

  function getJson() {
    // stop trying to get data if there is no more to display
    if (offset !== false) {
      $.get('/charityverifier/' + $('#nameBox').val() + '/' + offset, fillText);
    }
  }

  function fillText(data) {
    // if the search is at the end of the dataset, set offset to false
    if (data == false) {
      offset = false;
    } else {
      for (var i = 0; i < data.length; ++i) {
        $('.charityReturns table').append(
          '<tr> <td>' + data[i].org_name +
          '</td> <td>' + data[i].city +
          ', ' + data[i].state +
          "</td><td> <a class='btn btn-default' href='/organizations/new?id=" + data[i].id +
          "'>choose</a></td></tr>"
        );
      }
    }
  }

}
