package dreammungz.api.service;

import dreammungz.api.dto.achievement.AchievementResponse;
import dreammungz.db.entity.Achievement;
import dreammungz.db.repository.AchievementRepository;
import dreammungz.db.repository.MemberRepository;
import dreammungz.enums.Check;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

    /*
    @author 신슬기
    @since 2022. 09. 27.
    */

@Service
@Transactional
@Slf4j
@RequiredArgsConstructor
public class AchievementService {
    private final MemberRepository memberRepository;
    private final AchievementRepository achievementRepository;
    public AchievementResponse myAchievement(String publicAddress) {
        AchievementResponse achievementResponse = new AchievementResponse();
        List<Achievement> achievements = achievementRepository.findByMember(memberRepository.findByAddress(publicAddress).get());
        List<AchievementResponse.Achievement> userAchievement = new ArrayList<>();
        for(Achievement achievement:achievements){
            AchievementResponse.Achievement achieve = AchievementResponse.Achievement.builder()
                    .name(achievement.getJob().getName())
                    .isUnlock(achievement.getAchieve()==Check.Y)
                    .highestTier(achievement.getTier())
                    .build();
            userAchievement.add(achieve);
        }
        achievementResponse.setItems(userAchievement);
        return achievementResponse;
    }


}
