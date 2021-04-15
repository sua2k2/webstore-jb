<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 정보</title>
</head>
<body>
	<section>
		<div class="pull-right" style="padding-right: 50px">
			<a href="?language=ko">한글</a>|<a href="?language=en">English</a> <a
				href="<c:url value="/logout" />">로그아웃</a> <a href="/webstore-jb">홈으로</a>
		</div>
	</section>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Products</h1>
				<p>Add products</p>
			</div>
		</div>
	</section>
	<section class="container">
		<form:form method="POST" modelAttribute="newProd"
			onsubmit="return validateUnits(this)" class="form-horizontal"
			enctype="multipart/form-data">
			<form:errors path="*" cssClass="alert alert-danger" element="div" />
			<fieldset>
				<legend>신상품 정보 입력</legend>
				<span>${errermessage}</span>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="productId">
						<spring:message code="addProduct.form.productId.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="productId" path="productId" type="text"
							class="form:input-large" />
						<form:errors path="productId" cssClass="text-danger" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="name">
						<spring:message code="addProduct.form.prodName.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="name" path="name" type="text"
							class="form:input-large" />
						<form:errors path="name" cssClass="text-danger" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="unitPrice">
						<spring:message code="addProduct.form.unitPrice.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="unitPrice" path="unitPrice" type="text"
							class="form:input-large" />
						<form:errors path="unitPrice" cssClass="text-danger" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="manufacturer">
						<spring:message code="addProduct.form.manufacturer.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="manufacturer" path="manufacturer" type="text"
							class="form:input-large" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="category">
						<spring:message code="addProduct.form.category.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="category" path="category" type="text"
							class="form:input-large" />
						<form:errors path="category" cssClass="text-danger" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="unitsInStock">
						<spring:message code="addProduct.form.unitsInStock.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="unitsInStock" path="unitsInStock" type="text"
							class="form:input-large" />
						<form:errors path="unitsInStock" cssClass="text-danger" />
					</div>
				</div>
				<!-- 
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="unitsInOrder">
						주문 수량</label>
					<div class="col-lg-10">
						<form:input id="unitsInOrder" path="unitsInOrder" type="text"
							class="form:input-large" />
					</div>
				 
				</div>-->
				<div class="form-group">
					<label class="control-label col-lg-2" for="description"> <spring:message
							code="addProduct.form.description.label" />
					</label>
					<div class="col-lg-10">
						<form:textarea id="description" path="description" rows="2" />
					</div>
				</div>
				<!-- 
				<div class="form-group">
					<label class="control-label col-lg-2" for="discontinued">
						생산 중단됨</label>
					<div class="col-lg-10">
						<form:checkbox id="discontinued" path="discontinued" />
					</div>
				</div>
				 -->
				<div class="form-group">
					<label class="control-label col-lg-2" for="condition"> <spring:message
							code="addProduct.form.condition.label" /></label>
					<div class="col-lg-10">
						<form:radiobutton path="condition" value="New" />
						<spring:message code="addProduct.form.new.radiobutton" />
						<form:radiobutton path="condition" value="Old" />
						<spring:message code="addProduct.form.old.radiobutton" />
						<form:radiobutton path="condition" value="Refurbished" />
						<spring:message code="addProduct.form.refurbished.radiobutton" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-2" for="productImage"> <spring:message
							code="addProduct.form.productImage.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="productImage" path="productImage" type="file"
							class="form:input-large" />
						<form:errors path="productImage" cssClass="text-danger" />
					</div>
				</div>
				<!-- 상품 안내서 입력 -->
				<div class="form-group">
					<label class="control-label col-lg-2" for="productManual">
						<spring:message code="addProduct.form.productManual.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="productManual" path="productManual" type="file"
							class="form:input-large" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-primary"
							value="Add" />
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
	<script type="text/javascript">
		function validateUnits(form) {
			if (!document.getElementById("unitsInStock").value) {
				document.getElementById("unitsInStock").value = "0";
			}
		}
	</script>
</body>
</html>