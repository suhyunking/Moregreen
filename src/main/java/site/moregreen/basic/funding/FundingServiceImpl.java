package site.moregreen.basic.funding;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;
import site.moregreen.basic.command.DeliveryDto;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.UploadDto;
import site.moregreen.basic.like.LikeMapper;
import site.moregreen.basic.util.Criteria;

@Log
@Service("fundingService")
@Transactional(readOnly = true) //service impl에서 모든 method에 적용됨 (select에서 사용)
public class FundingServiceImpl implements FundingService{

	@Autowired
	FundingMapper fundingMapper;
	
	@Autowired
	LikeMapper likeMapper;
	
	@Value("${project.upload.path}")
	private String uploadPath;
	
	
	//폴더생성함수
	public String makeFolder() {
		
		String path = "upload";
		File file = new File(uploadPath + "\\" + path);
		if( file.exists() == false ) {
			file.mkdirs(); //파일생성
			log.info(file.getPath());
			log.info("파일 생성 완료");
		}
		return path; //경로
	}
	
	@Override
	@Transactional(rollbackFor = RuntimeException.class) //select 외에 동작의 경우 RuntimeException 또는 상속 받은 하위 클래스들에 모두 적용 예외 발생 시 Spring framework에 맞게 바꾸는데, 모든 exception은 runtime exception을 상속받은 exception calss이다. 
	public int modifyFunding(FundingDto dto) {
		fundingMapper.updateFunding(dto);		
		return 1;
	}
	
	
	// 등록
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int addFunding(FundingDto dto, List<MultipartFile> files, List<MultipartFile> mainFiles, List<MultipartFile> contentFiles) {
		fundingMapper.createFunding(dto);
		
		int f_num = dto.getF_num();
		
		// 대표 사진 사진 업로드
		for(MultipartFile file: mainFiles) {
			//실제파일명 (브라우저별로 조금씩 다를수가있음)
			String origin = file.getOriginalFilename();
			//저장할파일명(경로가 \\가 들어오는 경우 잘라서 처리)
			String filename = origin.substring(origin.lastIndexOf("\\") + 1);
			//파일사이즈
			long size = file.getSize();
			//랜덤이름
			String uuid = UUID.randomUUID().toString();
			//업로드경로
			String saveName = uploadPath + "/main_" + uuid + "_" + filename;
			
			try {
				File saveFile = new File(saveName); 
				file.transferTo(saveFile); //파일업로드
				//썸네일 생성 업로드
				//Thumbnailator.createThumbnail(saveFile, new File(thumbnailName) , 160, 160);
				
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("업로드중 에러 발생");
			}
			
			fundingMapper.createFundingFile(UploadDto.builder()
											  .filename(filename)
											  .uuid(uuid)
											  .f_num(f_num)
											  .filetype(1)
											  .build()
											);
			
		}
		
		for(MultipartFile file: contentFiles) {
			//실제파일명 (브라우저별로 조금씩 다를수가있음)
			String origin = file.getOriginalFilename();
			//저장할파일명(경로가 \\가 들어오는 경우 잘라서 처리)
			String filename = origin.substring(origin.lastIndexOf("\\") + 1);
			//파일사이즈
			long size = file.getSize();
			//랜덤이름
			String uuid = UUID.randomUUID().toString();
			//업로드경로
			String saveName = uploadPath + "/content_" + uuid + "_" + filename;
			
			try {
				File saveFile = new File(saveName); 
				file.transferTo(saveFile); //파일업로드
				//썸네일 생성 업로드
				//Thumbnailator.createThumbnail(saveFile, new File(thumbnailName) , 160, 160);
				
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("업로드중 에러 발생");
			}
			
			fundingMapper.createFundingFile(UploadDto.builder()
											  .filename(filename)
											  .uuid(uuid)
											  .f_num(f_num)
											  .filetype(2)
											  .build()
											);
			
		}
		
		//사업자 등록증 사진 업로드
				for(MultipartFile file: files) {
					//실제파일명 (브라우저별로 조금씩 다를수가있음)
					String origin = file.getOriginalFilename();
					//저장할파일명(경로가 \\가 들어오는 경우 잘라서 처리)
					String filename = origin.substring(origin.lastIndexOf("\\") + 1);
					//파일사이즈
					long size = file.getSize();
					//랜덤이름
					String uuid = UUID.randomUUID().toString();
					//업로드경로
					String saveName = uploadPath + "/" + uuid + "_" + filename;
					//썸네일경로
					//String thumbnailName = uploadPath + "\\" + filepath  + "\\thumb_" + uuid + "_" + filename;
					
					try {
						File saveFile = new File(saveName); 
						file.transferTo(saveFile); //파일업로드
						//썸네일 생성 업로드
						//Thumbnailator.createThumbnail(saveFile, new File(thumbnailName) , 160, 160);
						
						
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("업로드중 에러 발생");
					}
					
					fundingMapper.createFundingFile(UploadDto.builder()
													  .filename(filename)
													  .uuid(uuid)
													  .f_num(f_num)
													  .filetype(0)
													  .build()
													);
					
				}
				
		
		return f_num;
	}

	@Override
	public List<FundingDto> retrieveFundingApplyList(Criteria cri) {
		return fundingMapper.selectFundingApplyList(cri);
	}

	@Override
	public int retrieveTotal(Criteria cri) {
		return fundingMapper.selectTotal(cri);
	}
	
	@Override
	public int retrieveApplyListTotal(Criteria cri) {
		return fundingMapper.selectApplyListTotal(cri);
	}
	
	@Override
	public int likeTotal(Criteria cri) {
		return likeMapper.likeTotal(cri);
	}

	// 펀딩 이미지 포함 상세 조회
	@Override
	public List<FundingDto> retrieveFundingDetail(int f_num) {
		return fundingMapper.selectFundingDetail(f_num);
	}

	// 조회
	@Override
	public List<FundingDto> retriveFundingList(Criteria cri) {
		return fundingMapper.selectFundingList(cri);
	}
	
	// 조회
		@Override
		public List<FundingDto> retriveAdminFundingList(Criteria cri) {
			return fundingMapper.selectAdminFundingList(cri);
		}
	
	@Override
	@Transactional(rollbackFor = RuntimeException.class)
	public int fundingAccept(FundingDto dto) {
		
		fundingMapper.fundingAccept(dto);
		
		return 0;
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int fundingReject(FundingDto dto) {

		fundingMapper.fundingReject(dto);
		
		return 0;
	}

	@Override
	public DeliveryDto retrieveDelivery(int m_num) {
		return fundingMapper.selectDelivery(m_num);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<FundingDto> retrieveRetiredFundingListForCancel() {
		
		// f_status가 3 인 펀딩 목록 조회
		List<FundingDto> list = fundingMapper.selectFundingListForCheckStatus();
		
		for(FundingDto dto : list) {

			if(dto.getF_rate() < 100.0) {
				fundingMapper.updateFundingStatusToFail(dto);
				log.info(dto.getF_title() + " 펀딩 실패");
			}else {
				fundingMapper.updateFundingStatusToSuccess(dto);
				log.info(dto.getF_title() + " 펀딩 성공");
			}
		}
		
		List<FundingDto> listForCancel = fundingMapper.selectFundingListForCancel();
		
		return listForCancel;
	}

	




	

	
}
