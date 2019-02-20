/* Demo purposes only */
const cardEffect = () => {
  $(".hover").mouseleave(
    function () {
      $(this).removeClass("hover");
    }
  );
};

export { cardEffect };
