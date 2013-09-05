package com.vaps.dao;

// selectlist => 레코드가 여러개일때
// selectone => 레코드가 한개일때~

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import com.vaps.bean.BoardList;
import com.vaps.bean.Members;

public class MembersDAO extends SqlSessionDaoSupport implements MemberInterface {
	private static final Statement ConnUtil = null;
	DataSource ds;
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
//-----------------------------
// 회원 관리
	@Override
	public int memInsert(Members mb) {
		// 회원가입 sql
		return getSqlSession().insert("MembersInterface.memInsert", mb);
	}
		
	public int confirmId(String id){
		// 회원가입 시 아이디 중복확인
		return getSqlSession().selectOne("MembersInterface.confirmId", id);
	}
	
	@Override
	public int getLoginResult(Map<String, String> map) {
		// 로그인시 id와 pwd 확인 과정
		return getSqlSession().selectOne("MembersInterface.getLoginResult", map);
	}

	@Override
	public Members getMemberInfo(String id) {
		// id에 해당하는 정보를 가져오기
		return getSqlSession().selectOne("MembersInterface.getMemberInfo", id);
	}
	
//-----------------------------
// 게시판 관련 로직 sql 문장을 요청한다 sqlMapper.xml 으로...
	@Override
	public List<BoardList> getBoardList(int pageNum) {
		// board list get
		return getSqlSession().selectList("MembersInterface.getBoardList", pageNum);
	}

	@Override
	public int getPageCount() {
		// board list paging
		return getSqlSession().selectOne("MembersInterface.getPageCount");
	}

	@Override
	public BoardList getContents(int b_num) {
		// board 게시글 보기
		return getSqlSession().selectOne("MembersInterface.getContents", b_num);
	}
	
	public BoardList getContentsModi(int b_num) {
		// board 게시글 내용 한글 수정폼으로 전달
		return getSqlSession().selectOne("MembersInterface.getContents", b_num);
	}
	
	@Override
	public int setContentsModi(BoardList wr) {
		// board 게시글 내용 수정 과정 처리
		return getSqlSession().update("MembersInterface.setContentsModi", wr);
	}

	@Override
	public int wrBoard(BoardList wr) {
		// board 게시글 쓰기
		return getSqlSession().insert("MembersInterface.setContents", wr);
	}

	@Override
	public int delContents(int b_num) {
		// board 게시글 삭제
		return getSqlSession().delete("MembersInterface.delContents", b_num);
	}

	@Override
	public int setUpdateCount(int b_num) {
		// board 조회수 증가
		return getSqlSession().update("MembersInterface.setUpdateCount", b_num);
	}
}