<%
   /*==============================================================================
	 �� SYSTEM				: SAF(Smart Aqua Farm) - ����Ʈ ����͸� �ý���
	 �� SOURCE FILE NAME		: logIn.jsp
	 �� DESCRIPTION			: ȸ�� �α��� ó��
	 �� COMPANY				:  
	 �� PROGRAMMER			: ������
	 �� DESIGNER				: -
	 �� PROGRAM DATE			: 2019.08.19
	 �� EDIT HISTORY			: 
	 �� EDIT CONTENT			: 
	==============================================================================*/
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.usertable.usertableDTO"%>
<jsp:useBean id="dao" class="com.usertable.usertableDAO"/>
<%
	// �ѱ���ġ
	request.setCharacterEncoding("EUC-KR");

	// ���� ����
	// ID/��й�ȣ/�̸�/����
	String ID = request.getParameter("ID");
	String PW = request.getParameter("PW");
	String Name = null;
	String Auth = null;
	
	// bool���� ���� / ��� �� ����
	String msg = "�α����� �Ұ��մϴ�. ID�� ��й�ȣ�� Ȯ���ϼ���.";
	String route = "../index.jsp";
	
	// login�Լ� ���
	usertableDTO dto = dao.login(ID, PW);
	
	// �̸�/���� �ҷ�����
	Name = dto.getUserName();
	Auth = dto.getUserAuth();
	
	// ����Ʈ�� ������� ������
	if(Name != null)
	{
		// �ѱ۷� ��ȯ
		if(Auth.equals("user"))
		{
			Auth = "�����";
		}
		else if(Auth.equals("admin"))
		{
			Auth = "�Ϲݰ�����";
		}
		else if(Auth.equals("sysadmin"))
		{
			Auth = "��ü������";
		}
		
		// ���/��������
		route = "main.jsp";
		msg = "�������. " + Name + "(" + ID +" / "+ Auth +") �ݰ����ϴ�.";
		
		//��������
		session.setAttribute("ID", ID);
		session.setAttribute("Name", Name);
		session.setAttribute("Auth", Auth);
	}
%>
<script>
	//���â ��� �� �̵�
	alert("<%=msg%>");
	location.href="<%=route%>";
</script>