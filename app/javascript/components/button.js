/* Demo purposes only */

const inithover = () => {
  $(".hover").mouseleave(
    function () {
      $(this).removeClass("hover");
    }
  );
};

export { inithover };
