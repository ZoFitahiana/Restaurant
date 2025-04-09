package edu.hei.school.restaurant.dtos.responses;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@AllArgsConstructor
@Getter
public class IngredientRest {
    private Long id;
    private String name;
    private List<PriceRest> prices;
    private List<StockMovementRest> stockMovements;
}
