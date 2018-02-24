package org.fgilbert.jsr223.examples;

import static java.lang.Math.*;
import org.apache.commons.math3.distribution.UniformRealDistribution;

public class ProposalDistributionUnivariateNormal extends ProposalDistributionUnivariate {

	private double standardDeviation;
	private double variance;
	private UniformRealDistribution unif = new UniformRealDistribution();
	
	public ProposalDistributionUnivariateNormal(double variance) {
		super();
		this.variance = variance;
		this.standardDeviation = sqrt(variance);
	}
	
	@Override
	public double density(double x, double given) {
		return 1 / sqrt(2 * PI * variance) * exp(-pow((x - given), 2) / (2 * variance));
	}

	@Override
	public double sample(double state) {
		return state + standardDeviation * sqrt(-2 * log(unif.sample())) * cos(2 * PI * unif.sample());
	}
}