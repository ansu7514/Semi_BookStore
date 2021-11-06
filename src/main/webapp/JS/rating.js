var rating = 0;
$(".rateyo-readonly-widg").rateYo({

  rating: rating,
  numStars: 5,
  precision: 2,
  minValue: 1,
  maxValue: 5
}).on("rateyo.change", function (e, data) {
  $(".rating-value-box").text(data.rating);
});	