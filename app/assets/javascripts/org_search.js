$(function() {

  $('#nameBox').keypress(function() {
    if ($('#nameBox').val().length >= 3) {
      getJson();
    }
  });
});

function getJson() {
  $.get('/charityverifier/' + $('#nameBox').val(), fillText);
}

function fillText(data) {

  if ($('.charityReturns table').html().length > 0) {
    $('.charityReturns table').html('');
  }

  if (data.length != 0) {
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
  else {
    $('.charityReturns table').append(
      '<tr><td>No results match that organization name.</td></tr>'
      );
  }
}
