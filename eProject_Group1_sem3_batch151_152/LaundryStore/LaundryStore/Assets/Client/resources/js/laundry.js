
$(document).ready(function () {

    /**
    * update product in cart
    */
    $("tr[data-id] input").on("input", function () {
        var id = $(this).closest("tr").attr("data-id");
        var price = $(this).closest("tr").attr("data-price");
        var discount = $(this).closest("tr").attr("data-discount");
        var quantity = $(this).val();
        $.ajax({
            type: 'post',
            url: "/ShoppingCart/updateQuantity/",
            data: {
                idProduct: id,
                newQuantity: quantity
            },
            success: function (response) {
                $("#total").html(response[0]);
            }
        })
        var amount = price * quantity;
        var totalRow = amount * (100 - discount) / 100;
        $(this).closest("tr").find("#totalRow").html(totalRow);
    });

    /**
    * remove item in cart
    */
    $(".btn-cart-remove").click(function () {
        swal({
            title: "Thông báo",
            text: "Bạn có chắc muốn xóa dịch vụ này khỏi đơn hàng !",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                var id = $(this).closest("tr").attr("data-id");
                $.ajax({
                    type: 'post',
                    url: "/ShoppingCart/removeItemInCart/",
                    data: {
                        productId: id
                    },
                    success: function (response) {
                        if (response == 1) {
                            return errorRemoveItemInCart();
                        }
                        removeItemInCartSuccess();
                        $("#total").html(response[1]);
                    }
                })
                $(this).closest("tr").remove();
            }
        });
    });

    /**
    * function clear all product in cart
    */
    $(".btn-cart-clear").click(function () {
        swal({
            title: "Thông báo",
            text: "Bạn có chắc muốn xóa toàn bộ dịch vụ khỏi đơn hàng !",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                $.ajax({
                    type: 'post',
                    url: "/ShoppingCart/clearItemInCart/",
                    success: function (response) {
                        if (response == 1) {
                            errorNotExistItemInCart();
                        } else if (response == 2) {
                            removeItemInCartSuccess();
                        }
                        $("table>tbody").html("");
                        $("#total").html(0);
                    }
                })
            }
        });
    });

});

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

/**
 * Su kien thuc hien thanh toan don hang 
 */
function purchase() {
    var fullname = document.getElementById("fname").value;
    var email = document.getElementById("Email").value;
    var phone = document.getElementById("phone").value;
    var county = document.getElementById("county").value;
    var address = document.getElementById("address").value;
    if (document.getElementById("comment").value == null) {
        var comment = "Không chú thích gì";
    } else {
        var comment = document.getElementById("comment").value;
    }
    $.ajax({
        type: 'post',
        url: "/ShoppingCart/purchase/",
        data: {
            fullName: fullname,
            email: email,
            phone: phone,
            county: county,
            address: address,
            description: comment
        },
        success: function (response) {
            if (response == 1) {
                return successPurchase();
            }
        }
    })
    
}
/**
 * check va thay doi mat khau cho customer
 * */
function changePassword() {
    var currentPassword = document.getElementById("currentPassword").value;
    var newPassword = document.getElementById("newPassword").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var currentPass = document.getElementById("currentPass").value;
    var idCustomer = document.getElementById("idCustomer").value;
    console.log(currentPassword);
    console.log(newPassword);
    console.log(confirmPassword);
    console.log(currentPass);
    console.log(idCustomer);
    /*if (currentPassword != currentPass) {
        errorUpdateCurrentPass();
    } else {
        if (confirmPassword != newPassword) {
            errorUpdateConfirmPass();
        } else {
            $.ajax({
                type: "post",
                url: "/Admin/Account/changePassword/",
                data: {
                    id: idEmployee,
                    newPass: newPassword
                },
                success: function (response) {
                    if (response == 1) {
                        $("#exampleModal").modal('hide');
                        successChange();
                    }
                },
                error: function (error) {
                    errorUpdate();
                }
            })
        }
    }*/
}

/**
 * su kien onclick cho hinh thuc giat va tra do cua khach
 */
function hinhthucnhan1() {
    document.getElementById("hinhthuc_show1").style.display = 'block';
    document.getElementById("hinhthuc_show2").style.display = 'none';
}
function hinhthucnhan2() {
    document.getElementById("hinhthuc_show2").style.display = 'block';
    document.getElementById("hinhthuc_show1").style.display = 'none';
    var district = document.getElementById("county").value;
    console.log(district);
}

function hinhthucgiao1() {
    document.getElementById("kieu_show1").style.display = 'block';
    document.getElementById("kieu_show2").style.display = 'none';
}

function hinhthucgiao2() {
    document.getElementById("kieu_show2").style.display = 'block';
    document.getElementById("kieu_show1").style.display = 'none';
}

/*-----------------------------------------FUNCTION SUPPORT SHOW TEAMPLATE ALERT-------------------- */
function successAddToCart() {
    swal({
        title: "Thông báo !",
        text: "Bạn đã thêm sản phẩm vào trong giỏ hàng !",
        icon: "success",
        button: "OK",
    });
}

function successPurchase() {
    swal({
        title: "Thông báo !",
        text: "Đặt hàng thành công !",
        icon: "success",
        button: "OK",
    });
}

function errorNotExistItemInCart() {
    swal({
        title: "Thông báo !",
        text: "Không có đơn hàng nào trong giỏ hàng !",
        icon: "warning",
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

function errorRemoveItemInCart() {
    swal({
        title: "Thông Báo",
        text: "Xóa dịch vụ trong đơn hàng thất bại !",
        icon: "warning",
        button: "OK",
    });
}

function removeItemInCartSuccess() {
    swal({
        title: "Thông Báo",
        text: "Xóa dịch vụ trong đơn hàng thành công !",
        icon: "success",
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
        text: "Cập nhật thất bại",
        icon: "error"
    });
}

function successChange() {
    swal({
        title: "Update Successfully !",
        text: "Updated password information was successfully ",
        icon: "success",
    });
}

function errorUpdateCurrentPass() {
    swal({
        title: "Update Error !",
        text: "Current passwords do not match",
        icon: "error"
    });
}

function errorUpdateConfirmPass() {
    swal({
        title: "Update Error !",
        text: "Confirm passwords do not match",
        icon: "error"
    });
}

function errorDelete() {
    swal({
        title: "Cancel !",
        text: "Update failure",
        icon: "error"
    });
}
