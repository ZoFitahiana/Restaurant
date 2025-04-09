package edu.hei.school.restaurant.dtos.responses;

import edu.hei.school.restaurant.enums.Unit;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class DishIngredientRest {
    private IngredientBasicProperty ingredient;
    private Double requiredQuantity;
    private Unit unit;
}
