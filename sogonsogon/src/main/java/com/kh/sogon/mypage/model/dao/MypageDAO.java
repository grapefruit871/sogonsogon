package com.kh.sogon.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.mypage.model.vo.HelpAnswer;
import com.kh.sogon.mypage.model.vo.ReportMember;
import com.kh.sogon.room.model.vo.Room;
import com.kh.sogon.room.model.vo.RoomMember;
import com.kh.sogon.roomboard.model.vo.RoomBoard;
import com.kh.sogon.roomboard.model.vo.RoomBoardReply;
import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.board.model.vo.Reply;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 비밀번호 확인 DAO
	 * @param memberNo
	 * @return result
	 */
	public String checkPwd(int memberNo) {
		return sqlSession.selectOne("mypageMapper.checkPwd", memberNo);
	}

	/** 회원 정보 수정 DAO
	 * @param loginMember
	 * @param newPwd1
	 * @return result
	 */
	public int updateInfo(Member upMember) {
		return sqlSession.update("mypageMapper.updateInfo", upMember);
	}

	/** 회원 탈퇴 DAO
	 * @param memberNo
	 * @return result
	 */
	public int deleteInfo(int memberNo) {
		return sqlSession.update("mypageMapper.deleteInfo", memberNo);
	}

	/** 전체 공지사항 수 조회 DAO
	 * @return noticeList
	 */
	public int getListNCount() {
		return sqlSession.selectOne("mypageMapper.getListNCount");
	}

	/** 페이징바에 따라 공지사항 조회 DAO
	 * @param pInfo
	 * @return
	 */
	public List<Board> selectNList(PageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectNList", null, rowBounds);
	}
	
	/** 전체 멤버 수 조회 DAO
	 * @return listCount
	 */
	public int getListMCount() {
		return sqlSession.selectOne("mypageMapper.getListMCount");
	}

	/** 페이징바에 따라 멤버 조회 DAO
	 * @param pInfo
	 * @return memberList
	 */
	public List<Member> selectMList(PageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectMList", null, rowBounds);
	}


	public int getListQCount() {
		return sqlSession.selectOne("mypageMapper.getListQCount");
	}


	public List<Help> selectQList(PageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectQList", null, rowBounds);
	}


	public int getListBCount(int memberNo) {

		return sqlSession.selectOne("mypageMapper.getListBCount", memberNo);
	}


	public List<Board> selectBList(PageInfo pInfo, int memberNo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectBList", memberNo, rowBounds);
	}

	public int getListRCount(int memberNo) {
		return sqlSession.selectOne("mypageMapper.getListRCount", memberNo);
	}

	public List<Reply> selectRList(PageInfo pInfo, int memberNo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectRList", memberNo, rowBounds);
	}

	public int reportCount() {
		return sqlSession.selectOne("mypageMapper.reportCount");
	}


	public int qnaCount() {
		return sqlSession.selectOne("mypageMapper.qnaCount");
	}


	public int roomCount() {
		return sqlSession.selectOne("mypageMapper.roomCount");
	}


	public int memberCount() {
		return sqlSession.selectOne("mypageMapper.memberCount");
	}

	public int getListDCount() {
		return sqlSession.selectOne("mypageMapper.getListDCount");
	}

	public List<Board> selectReport() {
		return sqlSession.selectList("mypageMapper.selectReport");
	}
	
	public List<Board> selectDList(PageInfo pInfo) {
				
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectDList", null, rowBounds);
	}


	public int getListRoomCount(List<RoomMember> roomMemberList) {
		return sqlSession.selectOne("mypageMapper.getListRoomCount", roomMemberList);
	}


	public List<RoomMember> selectRoomMemberList(int memberNo) {
		return sqlSession.selectList("mypageMapper.selectRoomMemberList", memberNo);
	}


	public List<Room> selectRoomList(PageInfo pInfo, List<RoomMember> roomMemberList) {
				
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("mypageMapper.selectRoomList", roomMemberList, rowBounds);
	}


	/** 공지사항 삭제 DAO
	 * @param boardNo
	 * @return result
	 */
	public int deleteNotice(int boardNo) {
		return sqlSession.update("mypageMapper.deleteNotice", boardNo);
	}


	/** 공지사항 상세조회 DAO
	 * @param boardNo
	 * @return board
	 */
	public Board noticeView(int boardNo) {
		return sqlSession.selectOne("mypageMapper.noticeView", boardNo);
	}


	public int selectBoardNo() {
		return sqlSession.selectOne("mypageMapper.selectBoardNo");
	}


	public int noticeWrite(Board board) {
		return sqlSession.insert("mypageMapper.noticeWrite", board);
	}


	public int restoreReport(int boardNo) {
		return sqlSession.update("mypageMapper.restoreReport", boardNo);
	}

	public List<ReportMember> findMember(int memberNo) {
		return sqlSession.selectList("mypageMapper.findMember", memberNo);
	}

	public int insertMember(ReportMember member) {
		return sqlSession.insert("mypageMapper.insertMember", member);
	}


	public int updateReport(ReportMember member) {
		return sqlSession.update("mypageMapper.updateReport", member);
	}


	public int restoreMember(int memberNo) {
		return sqlSession.update("mypageMapper.restoreMember", memberNo);
	}

	public int updateNotice(Board notice) {
		return sqlSession.update("mypageMapper.updateNotice", notice);
	}

	public Help helpView(int boardNo) {
		return sqlSession.selectOne("mypageMapper.helpView", boardNo);
	}

	/** 고객센터 답변 작성 DAO
	 * @param helpNo
	 * @param answer
	 * @return result
	 */
	public int insertAnswer(HelpAnswer helpAnswer) {
		return sqlSession.insert("mypageMapper.insertAnswer", helpAnswer);
	}

	public HelpAnswer selectAnswer(int boardNo) {
		return sqlSession.selectOne("mypageMapper.selectAnswer", boardNo);
	}

	
	/** 메인 공지사항 조회
	 * @return list
	 */
	public List<Board> mainNoticeList() {
		return  sqlSession.selectList("mypageMapper.mainNoticeList");
	}

	public int getListReportRoomCount() {
		return  sqlSession.selectOne("mypageMapper.getListReportRoomCount");
	}

	public List<RoomBoard> selectRoomReportList(PageInfo roomPInfo) {
				
		int offset = (roomPInfo.getCurrentPage() - 1) * roomPInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, roomPInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectRoomReportList", null, rowBounds);
	}

	public int deleteRoomReport(RoomBoard board) {
		return sqlSession.update("mypageMapper.deleteRoomReport", board);
	}

	public int restorReportRoom(RoomBoard board) {
		return sqlSession.update("mypageMapper.restorReportRoom", board);
	}

	public Board boardView(int boardNo) {
		return sqlSession.selectOne("mypageMapper.boardView",boardNo);
	}

	public List<Board> myReportBoard(String writer) {
		return sqlSession.selectList("mypageMapper.myReportBoard",writer);
	}

	public int getListroomBoardCount(int memberNo) {
		return sqlSession.selectOne("mypageMapper.getListroomBoardCount", memberNo);
	}

	public List<RoomBoard> selectRoomBoardList(PageInfo roomPInfo, int memberNo) {
		
		int offset = (roomPInfo.getCurrentPage() - 1) * roomPInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, roomPInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectRoomBoardList", memberNo, rowBounds);
	}

	public RoomBoard selectBoard(RoomBoard board) {
		return sqlSession.selectOne("mypageMapper.selectBoard", board);
	}

	public int updateHelp(int parentHelpNo) {
		return sqlSession.update("mypageMapper.updateHelp", parentHelpNo);
	}

	public int reportCount2() {
		return sqlSession.selectOne("mypageMapper.reportCount2");
	}

	public RoomBoard roomBoard(RoomBoard board) {
		return sqlSession.selectOne("mypageMapper.roomBoard", board);
	}

	public int reportInfo(int memberNo) {
		return sqlSession.update("mypageMapper.reportInfo", memberNo);
	}

	public int getListRoomReplyRoomCount(int memberNo) {
		return sqlSession.selectOne("mypageMapper.getListRoomReplyRoomCount", memberNo);
	}

	public List<RoomBoardReply> selectRoomReplyList(PageInfo pInfo, int memberNo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectRoomReplyList", memberNo, rowBounds);
	}

	public int findRoomNo(PageInfo pInfo, int i) {
		return sqlSession.selectOne("mypageMapper.findRoomNo", i);
	}

	public List<Help> selectMyHelp(PageInfo pInfo, int memberNo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectMyHelp", memberNo, rowBounds);
	}

	public int deleteHelp(int boardNo) {
		return sqlSession.update("mypageMapper.deleteHelp", boardNo);
	}

	public int getSearchCount(Map<String, Object> map) {
		return sqlSession.selectOne("mypageMapper.getSearchCount", map);
	}

	public List<Member> selectSearchList(PageInfo pInfo, Map<String, Object> map) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectSearchList", map, rowBounds);
	}
	
	
}
