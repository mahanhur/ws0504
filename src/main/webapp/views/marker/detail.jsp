<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let marker_detail = {
        init : function() {
            $("#register_btn").click ( function() {
                marker_detail.send();
            })
            $("#delete_btn").click ( function() {
                let c = confirm("삭제하시겠습니까?");
                if(c == true) {
                    location.href="/marker/deleteimpl?id=${mdetail.id}";
                }
            })
        },
        send : function() {
            $("#register_form").attr({
                method:'post',
                action:'/marker/detailimpl',
                enctype: 'multipart/form-data'
            });
            $("#register_form").submit();
        }

    };

    $( () => {
        marker_detail.init();
    });
</script>

<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Details</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="register_form" class="form-horizontal">
                    <input type="hidden" name="id" value="${mdetail.id}">
                    <input type="hidden" name="img" value="${mdetail.img}">
                    <img src="/uimg/${mdetail.img}" style="height:400px; display:block; margin:auto;">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="title">Title : </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="title" id="title" value="${mdetail.title}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="target">Target : </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="target" id="target" value="${mdetail.target}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lat">Latitude :</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="lat" id="lat" value="${mdetail.lat}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lng">Longitude :</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="lng" id="lng" value="${mdetail.lng}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="loc">Location :</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="loc" id="loc" value="${mdetail.loc}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="imgfile">Image:</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" name="imgfile" id="imgfile" placeholder="Input image">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="register_btn" class="btn btn-primary btn-user btn-block">update</button>
                            <button type="button" id="delete_btn" class="btn btn-danger btn-user btn-block">delete</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- /.container-fluid -->