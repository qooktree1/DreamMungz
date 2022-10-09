package dreammungz.api.controller;

import dreammungz.api.dto.achievement.AchievementResponse;
import dreammungz.api.service.AchievementService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

    /*
    @author 신슬기
    @since 2022. 09. 27.
    */

@RestController
@RequestMapping("/achievement")
@RequiredArgsConstructor
public class AchievementController {

    private final AchievementService achievementService;

    @ApiOperation(value = "성취한 업적 조회", notes = "지갑 주소를 바탕으로 달성한 업적을 제공한다.", response = AchievementResponse.class)
    @GetMapping("/{publicAddress}")
    public ResponseEntity<AchievementResponse> myAchievement(@ApiParam(value = "지갑 주소", required = true) @PathVariable String publicAddress) {
        AchievementResponse response = achievementService.myAchievement(publicAddress);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
