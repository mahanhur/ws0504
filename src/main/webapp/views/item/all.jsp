<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Item</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">All</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>IMG</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Rdate</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>IMG</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Rdate</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="i" items="${ilist}">
                        <tr>
                            <td><a href="#" data-toggle="modal" data-target="#target${i.id}"><img src="/uimg/${i.imgname}" style="height:150px;"></a></td>
                            <td><a href="/item/detail?id=${i.id}">${i.id}</a></td>
                            <td>${i.name}</td>
                            <td><fmt:formatNumber value="${i.price}" type="currency" currencySymbol="￦" pattern="#,###원" /></td>
                            <td><fmt:formatDate value="${i.rdate}" pattern="yyyy-MM-dd"/></td>
                        </tr>

                        <!-- Modal -->
                        <div id="target${i.id}" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Detail Image</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>${i.name}</p>
                                        <img src="/uimg/${i.imgname}" style="height:400px;"><hr/>
                                        <p><fmt:formatNumber value="${i.price}" type="currency" currencySymbol="￦" pattern="#,###원" /></p>
                                        <p><fmt:formatDate value="${i.rdate}" pattern="yyyy-MM-dd"/></p>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="/item/detail?id=${i.id}" class="btn btn-info" role="button">Detail</a>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- End of Modal -->
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->


