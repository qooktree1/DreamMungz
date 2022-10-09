package dreammungz.api.dto.achievement;

import dreammungz.enums.JobName;
import dreammungz.enums.Tier;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.List;

    /*
    @author 신슬기
    @since 2022. 09. 27.
    */

@Getter
@Setter
@ApiModel(value = "업적 달성 반환", description = "업적 달성 내역")
public class AchievementResponse {
    @ApiModelProperty(value = "업적 달성 리스트", name = "items")
    private List<Achievement> items;

    @Getter
    @Setter
    @RequiredArgsConstructor
    static public class Achievement {
        @ApiModelProperty(value = "직업 이름", name = "name", example = "KING", dataType = "String")
        private JobName name;
        @ApiModelProperty(value = "해금여부", name = "isUnlock", example = "true", dataType = "Boolean")
        private Boolean isUnlock;
        @ApiModelProperty(value = "획득한 최대 티어", name = "highestTier", example = "LEGENDARY", dataType = "String")
        private Tier highestTier;

        @Builder
        public Achievement(JobName name, boolean isUnlock, Tier highestTier) {
            this.name = name;
            this.isUnlock = isUnlock;
            this.highestTier = highestTier;
        }
    }
}
