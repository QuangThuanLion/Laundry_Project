/**
 * Su kien addToCart them san pham vao trong gio hang
 */

function addToCart() {
    var ids = $('tbody input[type=checkbox]:checked').map(function () {
        return $(this).val();
    }).get();
    $.ajax({
        type: 'post',
        url: "/ShoppingCart/addToCart/",
        contentType: "application/json",
        data: JSON.stringify(ids),
        success: function (response) {
            if (response == 1) {
                errorAddToCartNoProductIdInDB();
            } else if (response == 2) {
                errorDuplicateProduct();
            } else if (response == 3) {
                successAddToCart();
            }
        }

    })
    console.log(ids);
}

function successAddToCart() {
    swal({
        title: "Thông báo !",
        text: "Bạn đã thêm sản phẩm vào trong giỏ hàng !",
        icon: "success",
        button: "OK",
    });
}

function errorAddToCartNoProductIdInDB() {
    swal({
        title: "Thông Báo",
        text: "Vui lòng chọn dịch vụ bạn cần !",
        icon: "warning",
        button: "OK",
    });
}

function errorDuplicateProduct() {
    swal({
        title: "Thông báo !",
        text: "Dịch vụ bạn chọn đã có trong giỏ hàng, vui lòng kiểm tra !",
        icon: "warning",
        button: "OK",
    });
}

function errorDelete() {
    swal({
        title: "Cancel !",
        text: "Update failure",
        icon: "error"
    });
}