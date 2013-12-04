package com.vaps.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.vaps.bean.BoardList;
import com.vaps.bean.Members;
import com.vaps.bean.ReplyList;

public class MembersDAO extends SqlSessionDaoSupport implements MemberInterface {
	
//-----------------------------
// 회원 관리
	@Override
	public int memInsert(Members mb) {
		// 회원가입 sql
		return getSqlSession().insert("JoinSetInfo.insert", mb);
	}
		
	public int confirmId(String id){
		// 회원가입 시 아이디 중복확인
		return getSqlSession().selectOne("JoinGetChk.select", id);
	}
	
	@Override
	public int getLoginResult(Map<String, String> map) {
		// 로그인시 id와 pwd 확인 과정
		return getSqlSession().selectOne("LoginGetChk.select", map);
	}

	@Override
	public Members getMemberInfo(String id) {
		// id에 해당하는 정보를 가져오기
		return getSqlSession().selectOne("LoginGetInfo.select", id);
	}
	
//-----------------------------
// 게시판 관련 로직 sql 문장을 요청한다 sqlMapper.xml 으로...
	@Override
	public List<BoardList> getBoardList(int pageNum) {
		// board list get
		return getSqlSession().selectList("BoardGetList.select", pageNum);
	}

	@Override
	public int getPageCount() {
		// board list paging
		return getSqlSession().selectOne("BoardGetPageCNT.select");
	}

	@Override
	public BoardList getContents(int b_num) {
		// board 게시글 보기
		return getSqlSession().selectOne("BoardGetContents.select", b_num);
	}
	
	public BoardList getContentsModi(int b_num) {
		// board 게시글 내용 한글 수정폼으로 전달
		return getSqlSession().selectOne("BoardGetContents.select", b_num);
	}
	
	@Override
	public int setContentsModi(BoardList wr) {
		// board 게시글 내용 수정 과정 처리
		return getSqlSession().update("BoardSetModi.update", wr);
	}

	@Override
	public int wrBoard(BoardList wr) {
		// board 게시글 쓰기
		return getSqlSession().insert("BoardSetContetns.insert", wr);
	}

	@Override
	public int delContents(int b_num) {
		// board 게시글 삭제
		return getSqlSession().delete("BoardDelContents.delete", b_num);
	}

	@Override
	public int setUpdateCount(int b_num) {
		// board 조회수 증가
		return getSqlSession().update("BoardSetUpCNT.update", b_num);
	}

	@Override
	public List<ReplyList> getReply(int bnum) {
		// 리플을 읽어 오기
		return getSqlSession().selectList("BoardGetReply.select", bnum);
	}
	
	@Override
	public int rInsert(ReplyList rl) {
		// 리플을 입력
		// insert성공 1 실패 0
		return getSqlSession().insert("BoardSetReply.insert", rl);
	}
}