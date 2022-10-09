package dreammungz.api.dto.nft;

import dreammungz.enums.StatusName;
import lombok.Getter;
import lombok.Setter;
import org.jetbrains.annotations.NotNull;

@Getter
@Setter
public class StatusNameValue implements Comparable<StatusNameValue>{
    StatusName name;
    Long value;

    public StatusNameValue(StatusName name, Long value) {
        this.name = name;
        this.value = value;
    }

    @Override
    public int compareTo(@NotNull StatusNameValue o) {
        if(o.value<value){
            return 1;
        }else if(o.value>value){
            return -1;
        }
        return 0;
    }
}
