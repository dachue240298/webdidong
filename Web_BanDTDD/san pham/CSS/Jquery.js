$(document).ready(function()
{
    //Code Slide ảnh chạy trên trang chủ :
    var id="SlideJquery";
    var arr=$('#'+id+' img');
    var current=$('#'+id+' img:first-child');
    var i=0;
    var duration=4000;
    $('#'+id+' img').hide();
    //hàm slideshow
    function SlideShow(current)
    {
        current.fadeIn(duration,function(){
            $(this).fadeOut(duration,function(){
                ++i;
                if(i==arr.length)
                {
                    i=0;
                    current=$('#'+id+' img:first-child');
                    SlideShow(current);
                }
                else
                {
                    SlideShow(current.next());
                }
            });
        });
    }
    SlideShow(current);
    //End------------------------
    
    
    //Code hiển thị thanh Menu ngang :
    $("#topnav li").hover(function(){ 

        $(this).find('ul:first').css({visibility: "visible",display: "none"}).fadeIn(100); 
        },function(){ 
        $(this).find('ul:first').css({visibility: "hidden"}); 

        }); 
     //End-------------------------
     
     //Code hiển thị chức năng Tìm kiếm nâng cao trên trang chủ :
     $("#TimMoRong").hide();
     $("#btnSearchS").click(function (){
        $("#TimMoRong:hidden").show();
     });
     //End-------------------------
     
     
     //Code kiểm tra dữ liệu nhập đầy đủ trên trang Thêm mới nhà sản xuất :
     
     //End------------------------
     
     //Code kiểm tra dữ liệu nhập đầy đủ trên trang Thêm mới sản phẩm :
     $("#ckProID,#ckProName,#ckProFirmID,#ckProPic,#ckProPostDate,#ckProPrice,#ckProStatus").hide();
     $("#btnInsertProduct").click(function(){
        if($("#txtProID").val()=="")
        {
            $("#ckProID").css("color","red").show();
        }
        else
        {   
            $("#ckProID").hide();
        }
        if($("#txtProName").val()=="")
        {
            $("#ckProName").css("color","red").show();
        }
        else
        {   
            $("#ckProName").hide();
        }
        if($("#ddlFirmID").val()=="")
        {
            $("#ckProFirmID").css("color","red").show();
        }
        else
        {   
            $("#ckProFirmID").hide();
        }
        if($("#txtPicture").val()=="")
        {
            $("#ckProPic").css("color","red").show();
        }
        else
        {   
            $("#ckProPic").hide();
        }
        if($("#txtPostDate").val()=="")
        {
            $("#ckProPostDate").css("color","red").show();
        }
        else
        {   
            $("#ckProPostDate").hide();
        }
        if($("#txtPrice").val()=="")
        {
            $("#ckProPrice").css("color","red").show();
        }
        else
        {   
            $("#ckProPrice").hide();
        }
        if($("#txtStatus").val()=="")
        {
            $("#ckProStatus").css("color","red").show();
        }
        else
        {   
            $("#ckProStatus").hide();
        }
     });
     //--------End-------------------
     
     //Code kiểm tra dữ liệu nhập đầy đủ trên trang Đặt hàng online :
     $("#ckCusName,#ckAddress,#ckEmail,#ckPhone,#ckCaptcha").hide();
     $("#ctl00_Content1_btnDatHang").click(function(){
        if($("#txtCustomerName").val()=="")
        {
            $("#ckCusName").css("color","red").show();
        }
        else
        {
            $("#ckCusName").hide();
        }
        if($("#txtAddress").val()=="")
        {
            $("#ckAddress").css("color","red").show();
        }
        else
        {
            $("#ckAddress").hide();
        }
        if($("#txtEmail").val()=="")
        {
            $("#ckEmail").css("color","red").show();
        }
        else
        {
            $("#ckEmail").hide();
        }
        if($("#txtPhoneNumber").val()=="")
        {
            $("#ckPhone").css("color","red").show();
        }
        else
        {
            $("#ckPhone").hide();
        }
        if($("#txtCaptcha").val()=="")
        {
            $("#ckCaptcha").css("color","red").show();
        }
        else
        {
            $("#ckCaptcha").hide();
        }
     });  
     //-----------End-----------
     
     
     //Code  kiểm tra dữ liệu nhập đầy đủ trên trang quản lý Banner:
     $("#ckBannerID,#ckBannerName,#ckPicture,#ckLink,#ckPostDate,#ckLocation,#ckStatus").hide();
     $("#btnInsertBanner").click(function(){
         if($("#txtBannerID").val()=="")
         {
            $("#ckBannerID").css("color","red").show();
         }
     });
     //----------End----------------
     
     //Code kiểm tra tính hợp lệ của Email :
//     $("#form1").validate({
//        rules: {
//            <%=txtConfirmPassword.UniqueID%>:{      
//                required: true,      
//                minlength: 5,      
//                equalTo:'#<%=txtPassword.ClientID%>'
//              },
//            <%=txtUserName.UniqueID %>: {
//                minlength: 5,
//                required: true
//            },
//            <%=txtPassword.UniqueID %>: {
//                minlength: 5,
//                required: true
//            },
//            <%=txtEmail.UniqueID %>: {
//                required: true
//            },
//            <%=txtURL.UniqueID %>: {
//             required: true
//            }
//        }, messages: {
//        
//            <%=txtConfirmPassword.UniqueID%>:{       
//                required: "Nhập lại mật khẩu",	
//                minlength: jQuery.format("Nhập ít nhất {0} ký tự"),	
//                equalTo: "Mật khẩu xác nhận chưa đúng"
//            },
//            <%=txtUserName.UniqueID %>:{ 
//                required: "Vui lòng nhập Tên đăng nhập", 
//                minlength: "Tên đang nhập cần có ít nhất 5 ký tự" 
//            },
//             <%=txtPassword.UniqueID %>:{ 
//                required: "Chưa nhập mật khẩu", 
//                minlength: "Password cần có ít nhất 5 ký tự" 
//            },
//             <%=txtEmail.UniqueID %>:{ 
//                required: "Vui lòng nhập Email", 
//              
//            },
//             <%=txtURL.UniqueID %>:{ 
//                required: "Vui lòng nhập Url", 
//            }
//       }
//    });
});


