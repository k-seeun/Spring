<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- JSTL 사용하기 위한 설정 -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Bank List</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      background-color: #f5f5f5;
      color: #333;
      line-height: 1.6;
    }
    
    .container {
      max-width: 800px;
      margin: 40px auto;
      background: white;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    
    .header {
      background-color: #fff;
      border-bottom: 1px solid #eee;
      padding: 30px;
      text-align: center;
    }
    
    .header h1 {
      font-size: 24px;
      font-weight: 500;
      color: #333;
      margin-bottom: 8px;
    }
    
    .header p {
      color: #666;
      font-size: 14px;
    }
    
    .content {
      padding: 30px;
    }
    
    .form-section {
      background: #fafafa;
      padding: 25px;
      border-radius: 6px;
      margin-bottom: 25px;
      border: 1px solid #eee;
    }
    
    .form-section h2 {
      color: #333;
      margin-bottom: 20px;
      font-size: 18px;
      font-weight: 500;
    }
    
    .form-group {
      display: flex;
      gap: 12px;
      align-items: center;
      flex-wrap: wrap;
    }
    
    input[type="text"], input[type="number"] {
      padding: 10px 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 14px;
      flex: 1;
      min-width: 180px;
    }
    
    input[type="text"]:focus, input[type="number"]:focus {
      outline: none;
      border-color: #007bff;
    }
    
    .btn {
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      font-size: 14px;
      font-weight: 500;
      cursor: pointer;
      text-decoration: none;
      display: inline-block;
    }
    
    .btn-primary {
      background-color: #007bff;
      color: white;
    }
    
    .btn-primary:hover {
      background-color: #0056b3;
    }
    
    .btn-success {
      background-color: #28a745;
      color: white;
    }
    
    .btn-success:hover {
      background-color: #1e7e34;
    }
    
    .btn-danger {
      background-color: #dc3545;
      color: white;
    }
    
    .btn-danger:hover {
      background-color: #c82333;
    }
    
    .bank-list {
      list-style: none;
    }
    
    .bank-item {
      background: white;
      border: 1px solid #eee;
      border-radius: 6px;
      padding: 20px;
      margin-bottom: 12px;
    }
    
    .bank-info {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
    }
    
    .bank-name {
      font-size: 16px;
      font-weight: 500;
      color: #333;
    }
    
    .bank-balance {
      font-size: 16px;
      color: #28a745;
      font-weight: 500;
    }
    
    .bank-actions {
      display: flex;
      gap: 8px;
      align-items: center;
      flex-wrap: wrap;
    }
    
    .bank-actions input[type="number"] {
      width: 100px;
      min-width: auto;
    }
    
    .empty-state {
      text-align: center;
      padding: 40px;
      color: #666;
      font-style: italic;
    }
    
    @media (max-width: 768px) {
      .form-group {
        flex-direction: column;
        align-items: stretch;
      }
      
      .bank-info {
        flex-direction: column;
        align-items: flex-start;
        gap: 8px;
      }
      
      .bank-actions {
        flex-direction: column;
        align-items: stretch;
      }
      
      .bank-actions input[type="number"] {
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <h1>은행 관리 시스템</h1>
      <p>계좌 등록 및 입출금 관리</p>
    </div>
    
    <div class="content">
      <div class="form-section">
        <h2>새 계좌 등록</h2>
        <form action="/bank" method="post">
          <div class="form-group">
            <input type="text" name="name" placeholder="예금주명을 입력하세요" required>
            <input type="number" name="balance" placeholder="초기 잔액을 입력하세요" min="0" required>
            <button type="submit" name="action" value="regist" class="btn btn-primary">계좌 등록</button>
          </div>
        </form>
      </div>
      
      <div class="form-section">
        <h2>계좌 목록</h2>
        <ul class="bank-list">
          <c:choose>
            <c:when test="${empty bankList}">
              <div class="empty-state">
                <p>등록된 계좌가 없습니다. 새 계좌를 등록해보세요!</p>
              </div>
            </c:when>
            <c:otherwise>
              <c:forEach var="bank" items="${bankList}">
                <li class="bank-item">
                  <div class="bank-info">
                    <span class="bank-name">${bank.name}</span>
                    <span class="bank-balance">${bank.balance} 원</span>
                  </div>
                  <form action="/bank" method="post" class="bank-actions">
                    <input type="hidden" name="id" value="${bank.id}" />
                    <input type="hidden" name="name" value="${bank.name}"/>
                    <input type="number" name="balance" placeholder="금액 입력" min="0" required>
                    <button type="submit" name="action" value="deposit" class="btn btn-success">입금</button>
                    <button type="submit" name="action" value="withdraw" class="btn btn-danger">출금</button>
                  </form>
                </li>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>
    </div>
  </div>
</body>
</html>