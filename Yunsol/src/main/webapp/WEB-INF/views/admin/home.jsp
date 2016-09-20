<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                        	    관리자페이지 <small>Statistics Overview</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Dashboard
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i>  <strong>Like SB Admin?</strong> Try out <a href="http://startbootstrap.com/template-overviews/sb-admin-2" class="alert-link">SB Admin 2</a> for additional features!
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <!-- <i class="fa fa-comments fa-5x"></i> -->
                                        	<h3>강연</h3>
                                    </div>
                                    <div class="col-xs-6 text-right">
                                        <div class="huge">${speechReserveCount}</div>
                                        <div>New Applicant!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/admin/speech/noCheckReserveList.do">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <h3>마라톤 완주자</h3>
                                    </div>
                                    <div class="col-xs-6 text-right">
                                        <div class="huge">${marathonCount}</div>
                                        <div>New Finisher!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/admin/marathon/list.do?keyfield=marathon_status&keyword=0">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <h3>희망도서</h3>
                                    </div>
                                    <div class="col-xs-6 text-right">
                                        <div class="huge">${wishlistCount}</div>
                                        <div>New Application!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/admin/wishlist/list.do?keyfield=wish_status&keyword=0">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <h3>대출대기</h3>
                                    </div>
                                    <div class="col-xs-6 text-right">
                                        <div class="huge">${rentWaitingCount}</div>
                                        <div>New Lending!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/admin/bookrent/list.do?keyfield=rent_status&keyword=3">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                
                <!-- /.row -->