package jewellery;

public class Ring {

  MetalType metal;
  GemType gem;

  public Ring(MetalType metal) {
    this.metal = metal;
    this.gem = GemType.NONE;
  }
  public Ring(MetalType metal, GemType gem) {
    this.metal = metal;
    this.gem = gem;
  }

  public MetalType getMetal(){
    return this.metal;
  }
  public GemType getGem(){
    return this.gem;
  }

}
