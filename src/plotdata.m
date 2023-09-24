function [H] = plotdata(healthy,faulty14,faulty39,column)
    figure
    hold on
    plot(healthy(:,column),'g-')
    plot(faulty14(:,column),'r--')
    plot(faulty39(:,column),'b--')
    title('Time series for feature ',column)
    legend('healthy','faulty14','faulty39')
end

