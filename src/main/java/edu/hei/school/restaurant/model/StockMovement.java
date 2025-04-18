package edu.hei.school.restaurant.model;

import edu.hei.school.restaurant.enums.StockMovementType;
import edu.hei.school.restaurant.enums.Unit;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class StockMovement {
    private Long id;
    private Ingredient ingredient;
    private Double quantity;
    private Unit unit;
    private StockMovementType movementType;
    private Instant creationDatetime;
}
