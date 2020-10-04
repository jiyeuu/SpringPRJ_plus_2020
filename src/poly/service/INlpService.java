package poly.service;

import java.util.Map;

import poly.dto.NlpDTO;
import poly.dto.SongDTO;

public interface INlpService {

	//단어 정보 가져오기
	void getWord() throws Exception;
	
	Map<String, Integer> preProcessWordAnalysisForMind(NlpDTO pDTO) throws Exception;
	
	// 감정 분석
	int WordAnalysisForMind(String firstWord, String text) throws Exception;

	SongDTO preProcessWordAnalysisForMind2(NlpDTO nDTO)throws Exception;

}
